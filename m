Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 141SP2-00061T-00
	for mtd-list@infradead.org; Thu, 30 Nov 2000 12:01:28 +0000
From: dr john halewood <john@frumious.unidec.co.uk>
Reply-To: john@frumious.unidec.co.uk
To: David Woodhouse <dwmw2@infradead.org>, Simon Wood <Simon.Wood@pace.co.uk>
Subject: Re: M-System DOC Millennium with MTD.
Date: Fri, 9 Mar 71685 12:43:01 +0000
Content-Type: text/plain
Cc: "'wear-hard@haven.org'" <wear-hard@haven.org>,
        "'mtd@infradead.org'" <mtd@infradead.org>
References: <44632C76B97BD211AF6B00805FADCAB202D738E3@exchange.saltaire.pace.co.uk> <28915.975518673@redhat.com>
In-Reply-To: <28915.975518673@redhat.com>
MIME-Version: 1.0
Message-Id: <0011301200580F.00533@frumious.unidec.co.uk>
Content-Transfer-Encoding: 8bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

On Thu, 30 Nov 2000, David Woodhouse wrote:
>Simon.Wood@pace.co.uk said:
>>  3). Tried to 'mount /dev/nftla /floppy' and got error 'mount: /dev/
>> nftla has wrong major or minor number'.
>
>It hasn't found the DiskOnChip. mount(8) ought to give you a better error 
>than that though.

One tiny possibility: I've managed to get something similar when playing with
some spare DoCs I've got lying around (they're 8Mb 2001s salvaged from broken
wince thin clients). On loading them with the MSys firmware image doc2.fff,
which they suggest using with Linux, I get the following, which is similar to
Simon's error (system is 2.2.17+CVS from infradead.org):
Initializing MTD Layer
Giving out device 0 to M-Systems DiskOnChip 1000
M-Systems DiskOnChip driver. (C) 1999 Machine Vision Holdings, Inc.
M-Systems NAND Flash Translation Layer driver. (C) 1999 MVHI
$Id: mtd-patch-2.2.17,v 1.3 2000/11/15 22:56:48 sjhill Exp $
NFTL_notify_add for M-Systems DiskOnChip 1000
NFTL_open
ENODEV: thisNFTL = 0, minor = 23809, ip = c38c7320, fp = c37fbf68

...which isn't really suprising as it's misdetecting the chip for something it
isn't.  Reloading the DoC firmware with the MSys bloatware fixes it however.
(No, I haven't worked out how it misidentifies it yet).
 This sort of thing probably belongs in an FAQ/mini-HOWTO. I've made quite a
lot of notes already(1) which I'll brush up and submit if anyone's interested
or thinks it's worthwhile. 

cheers
john

(1) I'll leave out the bits about how to remove a DoC with a Swiss Army knife,
but the bit about which pins you can bend or break without it mattering too
much might be useful to other hardware thugs like myself ;-)


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
