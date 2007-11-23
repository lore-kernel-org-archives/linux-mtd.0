Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1IvZr7-0004sW-H0
	for linux-mtd@lists.infradead.org; Fri, 23 Nov 2007 09:50:15 -0500
Date: Fri, 23 Nov 2007 15:45:01 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Gregory CLEMENT <gclement00@gmail.com>
Subject: Re: Some news for this: [PATCH] [MTD] BLOCK_RO: Readonly Block Device
	Layer Over MTD ?
Message-ID: <20071123144500.GB1239@lazybastard.org>
References: <305035a40711210627p1ea1f2c0me1ee1f8e8d124552@mail.gmail.com>
	<20071121160804.GC20871@lazybastard.org>
	<305035a40711210828k65174f44t3d64e9ee33fe26bf@mail.gmail.com>
	<20071121105817.3adbfbb5@weaponx>
	<20071121171501.GE20871@lazybastard.org>
	<acd2a5930711210943o2d0ff33an60f8dbf0c706088d@mail.gmail.com>
	<20071121174541.GF20871@lazybastard.org>
	<acd2a5930711210956p5fe8e4dbx271d4e821c4fa9e6@mail.gmail.com>
	<305035a40711230635j6e9b2082l2d610040256b9088@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <305035a40711230635j6e9b2082l2d610040256b9088@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	Vitaly Wool <vitalywool@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 23 November 2007 15:35:17 +0100, Gregory CLEMENT wrote:
> 
>  As it seems that there is no objections on it, can you push the patch in mtd ?

I do object against your patch on formal grounds.  It lacks:
o a useful description,
o Signed-off-by:,
o diffstat,
o diff -up (you just had -u),
and maybe some more.

Also please fix your mailer so it doesn't word-wrap the patch.  I won't
read it in its current state.

You might want to start reading Documentation/Submit* about now. ;)

Jörn

-- 
Don't worry about people stealing your ideas. If your ideas are any good,
you'll have to ram them down people's throats.
-- Howard Aiken quoted by Ken Iverson quoted by Jim Horning quoted by
   Raph Levien, 1979
