Received: from blood.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BPyfk-0002i4-C0
	for linux-mtd@lists.infradead.org; Tue, 18 May 2004 08:05:56 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
To: Wookey <wookey@aleph1.co.uk>, linux-mtd@lists.infradead.org
Date: Tue, 18 May 2004 14:41:25 +1200
References: <20040517163945.GJ12570@knossos.aleph1.co.uk>
In-Reply-To: <20040517163945.GJ12570@knossos.aleph1.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20040518070547.9FF6D5209@blood.actrix.co.nz>
cc: YAFFS list <yaffs@toby-churchill.org>
Subject: Re: blkmtd (and YAFFS)
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

As David already pointed out, CF hides the ECC stuff (indeed some CF is not 
even based on NAND flash) so YAFFS is probably not really the best choice.

> I know we're not supposed to talk about CF cards here, but I'm not sure who
> else to ask about this...

Yes, mentioning CF on mtd is poor form :-).
>
> We have recently found that it's very easy to wear out crummy CF cards
> using conventional disk-journalling systems (ext3 wears a hole in the end
> of a 512MB flash card in <10 reboots) because every write goes through the
> journal section of the device, and clearly its internal controller is doing
> a very simple sector->flashpage mapping (yes, we should have turned off
> atime, but still it's amazingly exactly not what you wanted :-)
>
> So what I really want to do is use something that distributes the writes
> better than the internal controller so I'm thinking that YAFFS or JFFS2
> should do a better job, but still give us journalling/power fail safety.
>
> blkmtd appears to allow this but I see few mentions of it since early 2002.
> Is it stable, does it work, has anyone ever tried it with YAFFS?

CF always has been and always will be a "Kleenex technology" for the consumer 
market. Designing it in as part of a rugged system has always been ill 
advised.

CF controllers don't do explicit wear levelling. At least some do "implicit 
wear levelling"  by using a free pool rather like SmartMedia does. It would 
appear though that some don't even do that.

CF cards do not necessarily fail due to wear-out. They can get screwed up by 
corrupting their logical to physical mapping which I hunch is the more likely 
scenario. If this is happening then extra wear levelling is not going to help.

>
> Is there a better FS for this purpose (anyone know if reiserfs helps
> distribute writes around your 'disk' at all?)

You're making the (possibly invalid) assumption that your failures are due to 
wear out. If that is indeed the case then some such wear levelling fs might 
help. 

The biggest problem I see is that YAFFS and JFFSx achieve their robustness by 
dealing with the flash directly and do not have logical to physical mapping 
layers. Balancing YAFFS of JFFSx on top of something that relies on a logical 
to physical mapping just gives a false sense of security since there is no 
mechanism to repair errors at that level.

Both YAFFS anf JFFSx are journaling/log structured file systems. They can 
cope with write failures and can handle unclean dismounts, but they cannot 
recover data that has been lost; for that you need a RAID system or such. A 
corruption in a CF card results in lost info which will not be recoverable.


-- Charles
