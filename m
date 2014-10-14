Received: from smtprelay0108.hostedemail.com ([216.40.44.108]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xe3Am-0000cM-UN
 for linux-mtd@lists.infradead.org; Tue, 14 Oct 2014 14:34:01 +0000
Message-ID: <1413297205.3269.11.camel@joe-AO725>
Subject: Re: [PATCH v4] mtd: ubi: Extend UBI layer debug/messaging capabilities
From: Joe Perches <joe@perches.com>
To: Tanya Brokhman <tlinder@codeaurora.org>
Date: Tue, 14 Oct 2014 07:33:25 -0700
In-Reply-To: <543D304C.5000607@codeaurora.org>
References: <1413296037-22346-1-git-send-email-tlinder@codeaurora.org>
 <543D304C.5000607@codeaurora.org>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: dedekind1@gmail.com, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 ezequiel.garcia@free-electrons.com, Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-10-14 at 17:16 +0300, Tanya Brokhman wrote:
> On 10/14/2014 5:13 PM, Tanya Brokhman wrote:
> > If there is more then one UBI device mounted, there is no way to
> > distinguish between messages from different UBI devices.
> > Add device number to all ubi layer message types.
[]
> > diff --git a/drivers/mtd/ubi/attach.c b/drivers/mtd/ubi/attach.c
[]
> > @@ -206,7 +208,7 @@ static int validate_vid_hdr(const struct ubi_vid_hdr *vid_hdr,
> >   		 */
> >
> >   		if (vol_id != av->vol_id) {
> > -			ubi_err("inconsistent vol_id");
> > +			ubi_err(ubi, "inconsistent vol_id");
> >   			goto bad;
> >   		}
> >

If you are going to change all the ubi_<level> calls,
can you also please add a terminating newline to all
the uses for consistency with all the other
pr_<level>/dev_<level>/<etc>_<level> calls?

(and remove the newline from the ubi_<level> macros)

> > diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
[]
> > @@ -50,13 +50,14 @@
> >   #define UBI_NAME_STR "ubi"
> >
> >   /* Normal UBI messages */
> > -#define ubi_msg(fmt, ...) pr_notice("UBI: " fmt "\n", ##__VA_ARGS__)
> > +#define ubi_msg(ubi, fmt, ...) pr_notice("UBI-%d: %s:" fmt "\n", \
> > +				 ubi->ubi_num, __func__, ##__VA_ARGS__)
> >   /* UBI warning messages */
> > -#define ubi_warn(fmt, ...) pr_warn("UBI warning: %s: " fmt "\n",  \
> > -				   __func__, ##__VA_ARGS__)
> > +#define ubi_warn(ubi, fmt, ...) pr_warn("UBI-%d warning: %s: " fmt "\n",  \
> > +				   ubi->ubi_num, __func__, ##__VA_ARGS__)
> >   /* UBI error messages */
> > -#define ubi_err(fmt, ...) pr_err("UBI error: %s: " fmt "\n",      \
> > -				 __func__, ##__VA_ARGS__)
> > +#define ubi_err(ubi, fmt, ...) pr_err("UBI-%d error: %s: " fmt "\n",      \
> > +				 ubi->ubi_num, __func__, ##__VA_ARGS__)

Converting these macros to functions using "%pV"
will save quite a bit of text space by removing
a lot of "UBI-%d <foo>: " duplication.

Using ubi_notice instead of ubi_msg would be a
lot more standard too.
