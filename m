MIME-Version: 1.0
In-Reply-To: <1314335775-3384-2-git-send-email-tanmay.upadhyay@einfochips.com>
References: <CAMPhdO_qVn8JaX6orfnHHXjmi8pTQFb1SzMe2RQM9xMdTvimaQ@mail.gmail.com>
	<1314335775-3384-2-git-send-email-tanmay.upadhyay@einfochips.com>
Date: Fri, 26 Aug 2011 09:10:16 -0700
Message-ID: <CAN8TOE9ACmLyZFkPp9FJ4j59hSeHtLmUqYv39z3NW70M16muGQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: Replace DEBUG with MTD_DBG
From: Brian Norris <computersforpeace@gmail.com>
To: Tanmay Upadhyay <tanmay.upadhyay@einfochips.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: jason.chagas@marvell.com, eric.y.miao@gmail.com, dwmw2@infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Aug 25, 2011 at 10:16 PM, Tanmay Upadhyay
<tanmay.upadhyay@einfochips.com> wrote:
> Defining macro 'DEBUG' for debug prints conflicts with other
> subsystem where defining 'DEBUG' means enable debug code including
> debug prints and others. So, replaced DEBUG with MTD_DBG for MTD

DEBUG was killed from MTD recently in the subsystem tree for MTD,
l2-mtd-2.6.git:
git://git.infradead.org/users/dedekind/l2-mtd-2.6.git

The fix *should* be merged in the next merge window, so this patch is
unnecessary.

Brian
