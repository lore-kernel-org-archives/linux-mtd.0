Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q8ZM7-0006PJ-FX
	for linux-mtd@lists.infradead.org; Sat, 09 Apr 2011 14:41:44 +0000
Received: by ewy3 with SMTP id 3so1453521ewy.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 09 Apr 2011 07:41:41 -0700 (PDT)
Subject: Re: [PATCH v5 3/3] JFFS2: Retry Large Buffer Allocations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Grant Erickson <marathon96@gmail.com>
In-Reply-To: <1302277894-26132-4-git-send-email-marathon96@gmail.com>
References: <1302277894-26132-1-git-send-email-marathon96@gmail.com>
	<1302277894-26132-4-git-send-email-marathon96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sat, 09 Apr 2011 17:38:53 +0300
Message-ID: <1302359933.2787.11.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jarkko Lavinen <jarkko.lavinen@nokia.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-04-08 at 08:51 -0700, Grant Erickson wrote:
> Replace direct call to kmalloc for a potentially large, contiguous
> buffer allocation with one to mtd_kmalloc_up_to which helps ensure the
> operation can succeed under low-memory, highly- fragmented situations
> albeit somewhat more slowly.
> 
> Signed-off-by: Grant Erickson <marathon96@gmail.com>
> Tested-by: Ben Gardiner <bengardiner at nanometrics.ca>

Note, I killed this Tested-by because Ben did not test the JFFS2 part.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
