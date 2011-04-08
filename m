Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q8DDi-0001Fk-AK
	for linux-mtd@lists.infradead.org; Fri, 08 Apr 2011 15:03:35 +0000
Received: by eyh6 with SMTP id 6so1215416eyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 08 Apr 2011 08:03:32 -0700 (PDT)
Subject: Re: [PATCH v4] Retry Large Buffer Allocations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ben Gardiner <bengardiner@nanometrics.ca>
In-Reply-To: <BANLkTik0LfxcfridxFAGtm2KYpwngvokSQ@mail.gmail.com>
References: <1302198035-32577-1-git-send-email-marathon96@gmail.com>
	<BANLkTik0LfxcfridxFAGtm2KYpwngvokSQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 08 Apr 2011 18:00:44 +0300
Message-ID: <1302274844.2834.39.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Grant Erickson <marathon96@gmail.com>,
	Jarkko Lavinen <jarkko.lavinen@nokia.com>, Bastian.Ruppert@sewerin.de
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-04-08 at 10:45 -0400, Ben Gardiner wrote:
> I tested this on da850evm by cherry-picking commit
> 64542ac252d378dc7a1122064821a884e85a9954 from
> git://git.infradead.org/users/dedekind/l2-mtd-2.6.git.
> 
> I have a memory hole @32M (bootargs: mem=32M@0xc0000000
> mem=64M@0xc4000000) and I was also (like Bastian) getting "ubiformat:
> page allocation failure" errors.  Cherry-picking this commit fixed the
> problem for me; I was able to do 3x repeated ubiformats without error.
> 
> Tested-by: Ben Gardiner <bengardiner@nanometrics.ca>

Great, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
