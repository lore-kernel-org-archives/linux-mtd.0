Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13FZEj-0003Ea-00
	for mtd-list@infradead.org; Fri, 21 Jul 2000 10:36:53 +0100
Received: from mx0.i-way.net.uk ([212.49.192.2] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13FZEg-0003EU-00
	for mtd@infradead.org; Fri, 21 Jul 2000 10:36:51 +0100
Received: from m4exch.m4data.co.uk (host2.m4data.co.uk [212.49.209.214] (may be forged))
	by mx0.i-way.net.uk (8.9.3/8.9.3) with ESMTP id KAA01045
	for <mtd@infradead.org>; Fri, 21 Jul 2000 10:37:50 +0100
Message-ID: <00B4D286538DD311BC6E005004E9EFC7213F99@M4EXCH>
From: Simon Munton <Simon.Munton@m4data.co.uk>
To: "MTD (E-mail)" <mtd@infradead.org>
Subject: cfi_probe chip scanning
Date: Fri, 21 Jul 2000 10:36:47 +0100
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_000_01BFF2F7.30D6DF00"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01BFF2F7.30D6DF00
Content-Type: text/plain;
	charset="iso-8859-1"

After cfi_cfi_probe() has found the first set of chips, and starts looking
to see what else is there, the first address checked is set to the size of
the first chip detected. It doesn't take account of any interleaving of
chips.
So I get the following:

	physmap flash device: 800000 at 3800000
	Physically mapped flash: Found a coupled pair of CFI devices at 0 in
8 bit mode
		........
	Physically mapped flash: Found a coupled pair of CFI devices at
200000 in 8 bit mode
	T'was an alias for the chip at 0x0
	Physically mapped flash: Found a coupled pair of CFI devices at
400000 in 8 bit mode
	Not an alias. Adding
	Physically mapped flash: Found a coupled pair of CFI devices at
600000 in 8 bit mode
	T'was an alias for the chip at 0x400000
	 Amd/Fujitsu Extended Query Table at 0x0040
	number of CFI chips: 2

OK, so this isn't really a problem, as they are detected as aliases, but it
is redundant, and can be fixed by changing the for loop to:

        for (base = (1<<cfi.chipshift) * cfi.interleave; base < map->size;
base += (1<<cfi.chipshift) * cfi.interleave)
		cfi_probe_new_chip(map, base, &chip[0], &cfi);

I've added alias detection for 'coupled pair in 8bit mode', basically the
same as '1 device in 16bit mode', but with reads/writes changed for the
different sizes - see patch.

One other observation: as I read the CFI spec, and vendor datasheets, it
would imply that a single device in 16 bit mode would require a CFI query
command of 0x0098, and not 0x9898 as is used. Can anyone confirm that a 16
bit device responds correctly when given the 0x9898 command?
(Of course two interleaved 8 bit devices do require 0x9898 as the command)
(Also 32bit devices seem to want 0x00000098).

 <<cfi_probe.diff.gz>> 

========================================================
Simon Munton	simonm@m4data.co.uk
M4 Data Ltd	Tel: 44-1749-683800
Mendip Court, Bath Rd, Wells	Fax: 44-1749-673928
Somerset, BA5 3DG, England



------_=_NextPart_000_01BFF2F7.30D6DF00
Content-Type: application/octet-stream;
	name="cfi_probe.diff.gz"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="cfi_probe.diff.gz"

H4sICGAYeDkAA2NmaV9wcm9iZS5kaWZmAKVWbU/jRhD+HH7F6CRwgh3HCReuBKhAEFruIOU4Kh26
nqxNvMar2N6cvSZJK/57Z9Z24kCgXMmH+G1mduZ5npndZrMJI1+4k0QOuT2qnSUCPmYhdNrQdno7
Tq/rQMdxnA3TNKEVyIi3UhHJuBUprzXmSczDVtX/JshyfwfanV5nr/d+N/c/OoJme/cX6wOYdOnu
wtHRBtRqNch/EZs0f41ZxC0YspQ39vVH4UN9FIhJ2oB/9ItaaxtOAj4awyTh90JmKejv4MsEWCjQ
NYXt1kaTbCeJiNW4/u7s/OtlvwenMrdADwrAFIQi5rDpgfSrIPwVv7PAdS/OB33XxURMioWRQOB9
/kSr1cWhsw8CDsgXc88inQm+Mk1KVxtSvjeByLOENJBZ6MGQg4gh4cyDSHr44INQRgoy5oUXAjLl
xj3HhMlsDkpmmLVnU225CUGjQSOD9i7dWzkW38R3O1UsUaYz6zgNODwEZ9Ztd9uwtbWMD69w7pTO
nW7np53fl8573b1GCQfh0Rcq4AngH0hEQyMTIC13UoHx2TCuDePWIIQYwpOq0hNXzWIEXmUxUxwm
IRuhWJAIjR2LC3KRS4oc82nFkdawUQDZMOTNnH4VoAC0a5ULCwN5uUAqWNd0udNEKF7W68x8/K1H
fL90exNHbyPpf7G0UK3m6RZbSQNExHy+vtU95jHFbLhEXqps2As/XPWLEhrfnF4U9aralZRVaF/A
thgEpeFaNMnmBQzXw1A6PQPdy07PIUaQ/fHJglRqNRcipPptOE7TLOKPlFrBYDGqbowpfqFBxIbh
fGlL0FNE3SwoXGe2Gc70oFqltAJXLeEqS2JoL189AObIwxQzkxbFmxsJB0/4Pk94rCzwWRji+0Rm
d0GVpIfca0UeA7nCMdYcG2qNVm6w2Tk+cquK73NNm+P1ankgIYxVisa8PmaoTSVpyk5YwmIpvFcG
fNIdK6FXKXoLM0+IeShuHpabxiAnaAGvJzyCN5RyjNvWmC9G14+MJ3PdWTYM+Ewtay2i5f+FOLGH
plyThAgRMXqVGPWAaxQsPNpZ2WTCGdYo80DI3ZAvttpF9VlCClplT+/e1b2RGufy+Kt7cnbunvx+
fvVl2T8luptpD26kxPaL5+CHLA2KNDyu+EjRFngej7AvUY4rocBPZISbua2xrxwnVhfcX0J8KrmW
bMSUwv2IDWWmcE6lXCkR3yHAhNE1za1LmltN2pITah1SOVngZ8XCMV3RGBOesvlSaY9YLtgo6xxI
tdAQzgfPw4CYeZlfrp0V8AodwaEW/n/Y4QZ5CGcX7nX/+PT2JdsoU3yGtltrv7rpRMShHI3LENXP
pomHtMWp7Cqj7RRzw9mPJVaRQ0jg9a1MJ8WdTptOijsfHLzkB8UCzsGfFxd0NnzApZv5OYycsYJ6
++AA87N1boHwseN0XDyg6YVT8Tcv3pjrrBtY4svxYJuOejZWx5OQs3v+cws8cW9QXYuDp4vTzyXr
5XZj5bR8c77TnS8aOeAIBT5giuMI57Uc1Wll6ddTlWQjVRxlxT2KoAGmXnPRgNuwauuH9L5hwW9n
V+6n/vWgf4GL/AukyoL4FgwAAA==

------_=_NextPart_000_01BFF2F7.30D6DF00--


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
