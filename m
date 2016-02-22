Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aXr7I-0002Y6-So
 for linux-mtd@lists.infradead.org; Mon, 22 Feb 2016 14:05:43 +0000
Date: Mon, 22 Feb 2016 09:05:14 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Dave Chinner <david@fromorbit.com>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 Pushpal Sidhu <psidhu@gateworks.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: ubifs+overlayfs
Message-ID: <20160222140514.GA22131@redhat.com>
References: <CAD1M0635nyHDL6vo+KUWy-FJKU=VSHPpeWyj_aMA06wQNw1t0w@mail.gmail.com>
 <CAFLxGvx3Xe3pYPd=4sQR-_3_x=J9RsF7uhYpVK8EtbrcuV0kZA@mail.gmail.com>
 <20160221211921.GA25832@dastard>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160221211921.GA25832@dastard>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 22, 2016 at 08:19:21AM +1100, Dave Chinner wrote:
> On Sun, Feb 21, 2016 at 03:27:18PM +0100, Richard Weinberger wrote:
> > Cc'ing linux-mtd.
> > 
> > On Sat, Feb 20, 2016 at 1:02 AM, Pushpal Sidhu <psidhu@gateworks.com> wrote:
> > > It seems that overlayfs requires RENAME_WHITEOUT and RENAME_EXCHANGE.
> > > However, these two flags aren't currently supported in ubifs (or
> > > anything other than ext4, f2fs, and xfs). This causes any atomic
> > > renames to fail (e.g. using 'mv' command).
> > 
> > Hmm, right. I always thought overlayfs does checks at mount time.
> > But apparently I was wrong.
> > Thanks for pointing this out.
> 
> It doesn't check any of the requirements it has from the underlying
> filesystem. e.g. overlay requires DT_CHR for detecting whiteouts,
> but it doesn't check if the upper filesystem actually supports
> DT_CHR or not, and hence will fail to detect whiteouts correctly on
> such filesystems. I've been pushing people to fix this, so maybe
> patches will appear in the not too distant future...

Dave pushed me to write the patch to detect whether upper filesystem
supports d_type or not :-). I will cleanup what I have and post for
review.

Thanks
Vivek
