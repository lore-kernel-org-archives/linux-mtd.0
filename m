Received: from proxy.force.de ([158.116.254.130])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18CcyL-0000wx-00
	for <linux-mtd@lists.infradead.org>; Fri, 15 Nov 2002 09:41:10 +0000
Received: from ex-deu-munich02.force.de (ex-deu-munich02.force.de [10.254.2.10])
	by proxy.force.de (8.11.4/8.11.4) with ESMTP id gAFABi203629
	for <linux-mtd@lists.infradead.org>; Fri, 15 Nov 2002 11:11:44 +0100 (MET)
Message-ID: <9CFB9DA5261CD611A29B00508B789048380A58@ex-deu-munich02.force.de>
From: "Gettert, Wolfram" <Wolfram.Gettert@fci.com>
To: linux-mtd@lists.infradead.org
Subject: RE: Support for command set 0003 not present
Date: Fri, 15 Nov 2002 11:11:43 +0100
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hallo,
since I use the kernel 2.2.18 I had to apply the inter_module_register
patch.
Now everthing is Ok.


Wolfram

> -----Original Message-----
> From: J B [mailto:mad_flasher@hotmail.com]
> Sent: Donnerstag, 14. November 2002 17:41
> To: Wolfram.Gettert@fci.com; linux-mtd@lists.infradead.org
> Subject: Re: Support for command set 0003 not present
> 
> 
> >From: "Gettert, Wolfram" <Wolfram.Gettert@fci.com>
> >
> >Support for command set 0003 not present
> >gen_probe: No supported vendor command set found
> 
> Is CONFIG_MTD_INTELEXT defined?  That could be the problem...
> 
> >The macro P_ID_INTEL_STD is defined. Do I have overseen to 
> load a module or 
> >is this command set not yet implemented. Is somebody working
> >on this or do I have to it on my own?
> 
> A chip with command set 0x0003 should work.  That command set looks
> like it is supported by cfi_cmdset_0001.c
> 
> Josh
> 
> _________________________________________________________________
> Help STOP SPAM with the new MSN 8 and get 2 months FREE*  
> http://join.msn.com/?page=features/junkmail
> 
