Received: from myyr.colleduc.ee ([193.40.113.30] helo=kiire.colleduc.ee)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BENRJ-0004Lu-8D
	for linux-mtd@lists.infradead.org; Fri, 16 Apr 2004 08:07:05 +0100
Date: Fri, 16 Apr 2004 10:07:02 +0300 (EEST)
From: Kalev Lember <kalev@colleduc.ee>
To: Gu Susan-w15879 <w15879@motorola.com>
In-Reply-To: <89DEFCC5DB33D411A27F00508BCF8A820A15B1DD@ZCH07EXM05.corp.mot.com>
Message-ID: <Pine.LNX.4.44.0404160957570.20183-100000@kiire.colleduc.ee>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: linux-mtd@lists.infradead.org
Subject: RE: FAT corruption
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 16 Apr 2004, Gu Susan-w15879 wrote:

> I haven't used 2.6.5 kernel, from your email, it seems Trueffs driver has been involved into mtd layer in 2.6.5?

No, with 2.6.5 kernel I use only the current mtd snapshot. There is no 
propietary TrueFFS driver in this kernel, I think that M-Sys has even not 
released a driver for 2.6 kernel series.

The problem that occurred was that if I wanted to us 2.4 kernel with 
M-Systems TrueFFS driver _after_ using the same chip with 2.6 kernel + 
current mtd snapshot, I would get filesystem corruption.

-- 
Best regards,
Kalev Lember
