Received: from ganon.smb.utfors.se ([195.58.112.27])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18GLTH-0000Rp-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Nov 2002 15:48:27 +0000
Received: from LUMENTIS02 ([212.105.56.242])
 by ganon.smb.utfors.se (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H6500LMG3ZJNP@ganon.smb.utfors.se> for
 linux-mtd@lists.infradead.org; Mon, 25 Nov 2002 17:18:56 +0100 (MET)
Date: Mon, 25 Nov 2002 17:18:55 +0100
From: Joakim Tjernlund <joakim.tjernlund@lumentis.se>
Subject: RE: mkfs.jffs2.c rework
In-reply-to: <025a01c29489$8e8b00e0$a3b270d5@homeip.net>
To: johan.adolfsson@axis.com, David Woodhouse <dwmw2@infradead.org>,
 andersen@codepoet.org
Cc: linux-mtd@lists.infradead.org
Reply-to: joakim.tjernlund@lumentis.se
Message-id: <IGEFJKJNHJDCBKALBJLLIEEOFIAA.joakim.tjernlund@lumentis.se>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
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

> 
> > 
> > Also, could we have an option to write cleanmarkers to the beginning of 
> > each block?
> > 
> > --
> > dwmw2
> 
> Here is a patch to add cleanmarkers and some minor bugfix:
> Here is what I would use as a comment:
> --
> Added support for adding cleanmarkers to start of every eraseblock.
> --no-cleanmarkers disables it.
> --cleanmarker=SIZE changes the cleanmarker size.
> 
> Clean up hardcoded 16 to sizeof(ffbuf).
> Added missing pad_block_if_less_than() in output_reg().
> --
> Please apply if it looks ok.
> /Johan

Hi All

I had a quick look, here is my comments:

I think this:
+	cleanmarker.totlen =   cpu_to_target32(cleanmarker_size);
+	cleanmarker.hdr_crc = cpu_to_target32(crc32(0, &cleanmarker, sizeof(struct jffs2_unknown_node)-4));

should be:
+	cleanmarker.totlen =   cpu_to_target32(cleanmarker_size);
+	cleanmarker.hdr_crc = cpu_to_target32(crc32(0, &cleanmarker, cleanmarker_size -4));


If my memory serves me correct, I think the semantics of the clean marker has changed somewhat.
A clean erase block with only a clean maker on it will have the ACCURATE bit set, but once you
write to it you should clear the ACCURATE bit. This is an optimization that enables JFFS2 to
avoid scanning empty erase blocks.

 Jocke
