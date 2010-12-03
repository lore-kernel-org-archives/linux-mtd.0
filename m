Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by casper.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1POStN-0008G9-CQ
	for linux-mtd@lists.infradead.org; Fri, 03 Dec 2010 10:29:30 +0000
Received: by bwz5 with SMTP id 5so8492700bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Dec 2010 02:28:38 -0800 (PST)
Subject: Re: UBIFS partition on NOR flash not mountable after power cut test
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Anatolij Gustschin <agust@denx.de>
In-Reply-To: <20101203110719.3a9d14f2@wker>
References: <20101129195014.19224240@wker> <20101201130534.5b95ce83@wker>
	<20101201164447.2215bc58@wker> <1291264926.14534.32.camel@koala>
	<20101203110719.3a9d14f2@wker>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Dec 2010 12:28:05 +0200
Message-ID: <1291372085.2365.49.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Detlev Zundel <dzu@denx.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-12-03 at 11:07 +0100, Anatolij Gustschin wrote:
> UBI: scrubbed PEB 149 (LEB 0:19), data moved to PEB 40
> 
> My question is: should this PEB really be preserved? I think, no.
> It was prepared for erasure and would be entirely erased if no
> interruption would occur.

Well, in general, my thinking is, if only the EC header is corrupted, we
do not know why - may be this was just because of some bit-flips or
radiation, and UBI better preserves it, just in case. I mean, there is a
risk to destroy useful data otherwise.

Then the upper layer SW like UBIFS should know what it was erasing, and
should re-issue the erasure. This is also a requirement made by the
"unstable bits" problem Matthiew found on NAND, and challenged me with.

To put is simple: I think it is saver for UBI to preserve it. Upper
layers will erase it again if it is not needed.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
