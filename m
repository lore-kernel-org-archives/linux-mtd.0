Received: from smtprelay0246.hostedemail.com ([216.40.44.246]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XnrYD-0003hY-WA
 for linux-mtd@lists.infradead.org; Mon, 10 Nov 2014 16:10:46 +0000
Message-ID: <1415635817.8868.6.camel@perches.com>
Subject: Re: [PATCH] UBI: Extend UBI layer debug/messaging capabilities -
 cosmetics
From: Joe Perches <joe@perches.com>
To: dedekind1@gmail.com
Date: Mon, 10 Nov 2014 08:10:17 -0800
In-Reply-To: <1415625297.22887.108.camel@sauron.fi.intel.com>
References: <1415531185-2343-1-git-send-email-tlinder@codeaurora.org>
 <1415621918.22887.80.camel@sauron.fi.intel.com>
 <5460B553.5060401@codeaurora.org>
 <1415625297.22887.108.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Tanya Brokhman <tlinder@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, hujianyang@huawei.com,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-11-10 at 15:14 +0200, Artem Bityutskiy wrote:
> On Mon, 2014-11-10 at 14:53 +0200, Tanya Brokhman wrote:
> > On 11/10/2014 2:18 PM, Artem Bityutskiy wrote:
> > > On Sun, 2014-11-09 at 13:06 +0200, Tanya Brokhman wrote:
> > >>
> > >>   /* Normal UBI messages */
> > >>   #define ubi_msg(ubi, fmt, ...) pr_notice("UBI-%d: %s:" fmt "\n", \
> > >> -                                        ubi->ubi_num, __func__, ##__VA_ARGS__)
> > >> +                               (ubi ? ubi->ubi_num : UBI_MAX_DEVICES), \
> > >> +                               __func__, ##__VA_ARGS__)
> > >>   /* UBI warning messages */
> > >>   #define ubi_warn(ubi, fmt, ...) pr_warn("UBI-%d warning: %s: " fmt "\n", \
> > >> -                                       ubi->ubi_num, __func__, ##__VA_ARGS__)
> > >> +                               (ubi ? ubi->ubi_num : UBI_MAX_DEVICES), \
> > >> +                               __func__, ##__VA_ARGS__)
> > >>   /* UBI error messages */
> > >>   #define ubi_err(ubi, fmt, ...) pr_err("UBI-%d error: %s: " fmt "\n", \
> > >> -                                     ubi->ubi_num, __func__, ##__VA_ARGS__)
> > >> +                               (ubi ? ubi->ubi_num : UBI_MAX_DEVICES), \
> > >> +                               __func__, ##__VA_ARGS__)
> > >
> > > Why did you make these changes? It is preferable to not add another 'if'
> > > statement to this macro to handle one or 2 cases - much bloat, little
> > > gain.
> > >
> > > Could we please avoid this?
> > 
> > I just wanted to be on the safe side and prevent this macro being called 
> > with ubi=NULL that may crash the system. If you still prefer the "if" 
> > removed will do.
> 
> On the other hand, these are macros, and this if gets duplicated in many
> places and translate into few additional assembly instructions per
> message.

The thing that will make these uses smaller is to
convert them to functions.

There is a lot of extra duplicated "UBI-%s <msg_type>: "
constant string .text added.

Using a function uses a single copy of each prefix.

The __func__ variable can also be removed.
__builtin_return_address(0) may be substituted to save
a few more bytes per instance.

Something like:

(prototype)
__printf(2, 3)
void ubi_warn(struct ubi *ubi, const char *fmt, ...);

(implementation)
__printf(2, 3)
void ubi_warn(struct ubi *ubi, const char *fmt, ...)
{
	struct va_format vaf;
	va_list args;
	int device;

	va_start(args, format);

	vaf.fmt = format;
	vaf.va = &args;

	if (!ubi)
		device = UBI_MAX_DEVICE;
	else
		device = ubi->ubi_num;

	pr_warn("UBI-%d warning: %pf: %pV",
		device, __builtin_return_address(0), &vaf);

	va_end(args);
}
