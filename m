Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q8ZMh-0006Q0-GA
	for linux-mtd@lists.infradead.org; Sat, 09 Apr 2011 14:42:20 +0000
Received: by ewy3 with SMTP id 3so1453614ewy.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 09 Apr 2011 07:42:18 -0700 (PDT)
Subject: Re: [PATCH v4] Retry Large Buffer Allocations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ben Gardiner <bengardiner@nanometrics.ca>
In-Reply-To: <BANLkTik0LfxcfridxFAGtm2KYpwngvokSQ@mail.gmail.com>
References: <1302198035-32577-1-git-send-email-marathon96@gmail.com>
	<BANLkTik0LfxcfridxFAGtm2KYpwngvokSQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 09 Apr 2011 17:39:30 +0300
Message-ID: <1302359970.2787.12.camel@localhost>
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
> Hi Grant, Artem
> 
> Thanks for this fix!
> 
> On Thu, Apr 7, 2011 at 1:40 PM, Grant Erickson <marathon96@gmail.com> wrote:
> > When handling user space read or write requests via mtd_{read,write}
> > or JFFS2 medium scan requests, exponentially back off on the size of
> > the requested kernel transfer buffer until it succeeds or until the
> > requested transfer buffer size falls below the page size.
> >
> > This helps ensure the operation can succeed under low-memory,
> > highly-fragmented situations albeit somewhat more slowly.
> >
> >  v2: Incorporated coding style and comment feedback from Artem.
> >  v3: Incorporated more feedback from Artem. Retargeted patch against
> >      l2-mtd-2.6.
> >  v4: Incorporated feedback from Artem about compilation on 64-bit
> >      architectures.
> >
> > Signed-off-by: Grant Erickson <marathon96@gmail.com>
> 
> I tested this on da850evm by cherry-picking commit
> 64542ac252d378dc7a1122064821a884e85a9954 from
> git://git.infradead.org/users/dedekind/l2-mtd-2.6.git.

Grant sent an updated patch-set and added your Tested-by. However, there
were several conflicts which I had to. If you could test the final
patches again - that'd be great! They are in the same l2-mtd-2.6.git
tree:

8fa3c20 JFFS2: retry large buffer allocations
88ab142 mtd: mtdchar: retry large buffer allocations
99815a5 mtd: create function to perform large allocations

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
