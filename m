Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NF2LB-0004He-CV
	for linux-mtd@lists.infradead.org; Mon, 30 Nov 2009 09:14:46 +0000
Subject: Re: Making a UBIFS root file system
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Lambert <dave@lambsys.com>
In-Reply-To: <4B1137B2.4010302@lambsys.com>
References: <4B1137B2.4010302@lambsys.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 30 Nov 2009 11:14:30 +0200
Message-Id: <1259572470.7518.72.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2009-11-28 at 08:46 -0600, David Lambert wrote:
> Is there a similar tool to genext2fs for UBIFS? I would like to create a 
> root file system containing special files (/dev entries) without being 
> root. Any suggestions would be welcome.

Hi,

never used genext2fs, but I think there is nothing like this for UBIFS.
Would the "device table" work for you (see --devtable mkfs.ubifs
option).

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
