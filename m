Received: from relay2.clb.oleane.net ([213.56.31.22])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17urRU-0007k9-00
	for <linux-mtd@lists.infradead.org>; Fri, 27 Sep 2002 10:29:48 +0100
From: "free" <dag4004@free.fr>
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
Cc: "MTD mailing liste" <linux-mtd@lists.infradead.org>
Subject: RE: [newbie] MTD and tiny RAM
Date: Fri, 27 Sep 2002 11:34:20 +0200
Message-ID: <BNEJIGKFJNJLELKBCMDAOEJLCCAA.dag4004@free.fr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
In-Reply-To: <20020927090515.GB5144@wohnheim.fh-wedel.de>
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

>> I use a very tiny SRAM (128ko) battery backuped to save
>> very important and changeable data.
>> I have a char. driver for it (i know how to read/write it)
>> I would like to mount it on Linux VFS but it seems that
>> bloc drivers are RAM cached.
>> Acces on this SRAM must be immediatly apply (if power goes
>> down data must be safe)
>>
>> Does MTD could help me :
>> - is my SRAM not to tiny (128KO) for use with MTD ?
>> - could i acces to my SRAM through MTD in block mode without caching ?
>> - what king of file system could fit on such tiny RAM ?
>
>(This assumes 128KO == 128 kilobyte)
>
>You could use the slram driver for this and put a jffs2 on top of it.
>But slram uses eraseblocks of 64kiB and jffs2 needs 5 of those free
>for being operational. You should tweak the slram driver to use
>something closer to 4kiB.
>
>Jörn

I have a worry with jffs2, i use a kernel 2.2.17 and i was using an old CVS
snap shot. I have recently down load the last CVS and it does not compile
on my 2.2.17 kernel. My old CVS didn't have jffs2, it just have jffs.
