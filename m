Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14SMdm-0005EF-00
	for mtd-list@infradead.org; Mon, 12 Feb 2001 17:19:54 +0000
Message-ID: <020701c09517$48fc61e0$0a070d0a@axis.se>
Reply-To: "Johan Adolfsson" <johan.adolfsson@axis.com>
From: "Johan Adolfsson" <johan.adolfsson@axis.com>
To: "David Woodhouse" <dwmw2@infradead.org>,
        "Jonas Holmberg" <jonas.holmberg@axis.com>
Cc: <mtd@infradead.org>
References: <151F3D2AE9F0D3119E480004ACB8EA3701DEC941@cluster01.axis.se>  <14127.981995794@redhat.com>
Subject: Re: Problems with cfi_cmdset_0002.c 
Date: Mon, 12 Feb 2001 18:14:40 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Wouldn't it be possible to check both the bootloc and the erase regions and
do something like this? :

(Haven't looked in the code how the cfi structure is typed etc. and may be
totally
out when it comes to what the problem is, but you'll probably get the idea)

flip_cfi_table = 0;
if (bootloc == CFI_TOP_BOOT){
  /* We expect the small regions at the top */
  if (EraseRegionInfo[0].size <
       EraseRegionInfo[cfi->cfiq->NumEraseRegions-1].size){
    flip_cfi_table = 1;
 } else if (bootloc == CFI_BOTTOM_BOOT){
  /* We expect the small regions at the bottom */
  if (EraseRegionInfo[0].size >
       EraseRegionInfo[cfi->cfiq->NumEraseRegions-1].size){
    flip_cfi_table = 1;
 }

 if (flip_cfi_table){
   /* Flip the damn thing */
  ...
}

/Johan


----- Original Message -----
From: David Woodhouse <dwmw2@infradead.org>
To: Jonas Holmberg <jonashg@axis.com>
Cc: <mtd@infradead.org>
Sent: Monday, February 12, 2001 17:36
Subject: Re: Problems with cfi_cmdset_0002.c


>
> jonas.holmberg@axis.com said:
> >  I have now tested with a bottom boot chip also and it works (it is
> > not swapped and should not be). So the problem is how to find out that
> > the top boot chip is a top boot chip. A table does not sound like a
> > very nice solution, but I don't know of any other. The datasheet for
> > the flash chip does not mention the address used to read bootloc:
>
> > bootloc = cfi_read_query(map, (adr+15)*ofs_factor);
>
> The datasheet for the AM29LV320D lists it - page 23 of AMD publication
> #23579, Rev A; issued Nov 1, 2000.
>
> Personally, my inclination would be to return the poxy things to AMD
> complaining that the CFI tables are broken. How many are you buying?
>
> Otherwise, I think the JEDEC ID may be the only option.
>
>
> jonas.holmberg@axis.com said:
> >  I haven't got commit access...
>
> Gimme SSH public key.
>
> --
> dwmw2
>
>
>
>
> To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
>



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
