Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14mlB4-0002So-00
	for mtd-list@infradead.org; Tue, 10 Apr 2001 00:34:34 +0100
Message-ID: <1072F1A27E99D3119747005004B9A380EB98B0@MAIL>
From: Brett Carswell <BrettC@nulec.com.au>
To: 'David Woodhouse' <dwmw2@infradead.org>
Cc: "'mtd@infradead.org'" <mtd@infradead.org>
Subject: RE: CFI with 4 x8/x16 devices on a 32-bit bus 
Date: Tue, 10 Apr 2001 09:34:19 +1000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> BrettC@nulec.com.au said:
> > I have four flash chips in parallel on a 32 bit bus so my impression
> > is that I have an interleave of 4, a device type of 1 (8 bits) and a
> > buswidth of 4 (32bits). 
> 
[snipped]

> This stuff makes my head hurt :)
> 
> Thinks... Numbering CPU address lines by _byte_ addresses, A0 
> and A1 don't
> exist. A2 is driving the 'A-1' line (aka D15 in word mode) of 
> the flash
> chip, presumably. A3 is driving the A0 line, etc. Right? 
> Remembering that 
> the flash chip address lines are numbered by word (16-bit) addresses.
> 
> So to put 0x555 on the real address lines of the chip, we need to put 
> (0x555 << 3) == 0x2AA8 onto the CPU's address bus. And to put 
> 0x2AA on the 
> real address lines of the chip, we put (0x2AA << 3) == 0x1550 
> onto the 
> CPU's address bus.
> 
> Ignoring the fact that you wrote '<<' when you meant '*', why 
> do you think 
> we should be using the address 0x1554 (== 0x555 << 3)? What 
> am I missing 
> this time? :)
> 
> 0x1554 would be asserting the 'A-1' line of the flash chips. 
> Why would you 
> want to do that?
> 

My take on the datasheet is that when in byte mode, A-1 becomes the LSB of
the address.
The unlock 2 address in word mode is 0x2AA (8 bits set to 1) and byte mode
is 0x555 (9 bits set to 1). So in byte mode A-1 (the LSB on the device)
needs to be set and it can't possibly be by left shifting 0x2AA (which is
what the code does). I kludged up a solution that suited my needs by
changing lines in cfi_build_cmd_addr from

{
  return (cmd_ofs * type) * interleave;
}

to

{
  __u32 addr = (cmd_ofs * type) * interleave;

  if (interleave == 1)
    return addr;
  else
    return ((addr | (addr >> (interleave >> 1))) & 0xffffffff * interleave);
}

This ugly code fragment just propagates the alternating bit pattern through
to the LSB of the device. God only knows what else this will break but it
seems to have fixed the problem I had. I'm only hoping that I've fixed it by
working out what was wrong and not just stumbling across something that
happened to make it work.

> The address generation seems right. What exactly is going 
> wrong, and where?
> 
No writes or erases were working until I changed the code above.

> To confirm:
>  buswidth: obvious. (4 bytes)
>  interleave: Number of devices accessible through a single 
> bus-width access (4)
>  device type: _Device_ type (2). You ignore the 'A-1' line 
> because the magic
> 	addresses still need to be on the 'A0' line and above, 

This last point does not seem to be the case. The datasheet says :
Addresses are A19:A0 in word mode (BYTE# = V IH ), A19:A-1 in byte mode
(BYTE# = V IL ).
Not really much to be too confident about - but setting the LSB seems to be
the only difference between a non-working and a working system.

Thanks,
Brett


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
