Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z8OIy-0002vP-TO
 for linux-mtd@lists.infradead.org; Fri, 26 Jun 2015 07:44:09 +0000
Message-ID: <1435304624.9627.47.camel@sauron.fi.intel.com>
Subject: Re: [PATCH RESEND] ubifs: Introduce a mount option of force_atime.
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Date: Fri, 26 Jun 2015 10:43:44 +0300
In-Reply-To: <558CFB96.2000006@cn.fujitsu.com>
References: <1433831809.28854.17.camel@sauron.fi.intel.com>
 <55769D97.3010602@nod.at> <5577AC03.9060909@cn.fujitsu.com>
 <1433928078.14092.1.camel@sauron.fi.intel.com>
 <55780D1C.6080907@cn.fujitsu.com>
 <1433931934.14092.11.camel@sauron.fi.intel.com>
 <557812A4.8020409@cn.fujitsu.com>
 <1433934324.14092.15.camel@sauron.fi.intel.com>
 <55892D18.3020203@cn.fujitsu.com>
 <1435056240.7659.69.camel@sauron.fi.intel.com>
 <20150624003335.GG22807@dastard> <558BD010.6020207@cn.fujitsu.com>
 <1435226918.9627.14.camel@sauron.fi.intel.com>
 <558BD3B0.8080209@cn.fujitsu.com>
 <1435231689.9627.17.camel@sauron.fi.intel.com>
 <558CA82B.7050306@cn.fujitsu.com>
 <1435302083.9627.36.camel@sauron.fi.intel.com>
 <558CFB96.2000006@cn.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-fsdevel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Dave Chinner <david@fromorbit.com>, adrian.hunter@intel.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2015-06-26 at 15:13 +0800, Dongsheng Yang wrote:
> On 06/26/2015 03:01 PM, Artem Bityutskiy wrote:
> > On Fri, 2015-06-26 at 09:17 +0800, Dongsheng Yang wrote:
> ...
> 
> > This means that if a file-system (e.g., UBIFS or JFFS2) never supported
> > atime, it is harder to add atime support without breaking the old
> > behavior.
> >
> > What if we push the two "set NOATIME flag" lines of code down to
> > individual file-systems, instead of having it at the VFS level?
> 
>     TO be sure I understand it correctly, do you mean pushing the flags
> parsing work to individual file-systems? Then we can set the default
> behavior in file-system itself.

No, I mean removing these 2 lines from do_mount()

      /* Default to relatime */
      mnt_flags |= MNT_RELATIME;

and add them to the

struct file_system_type->mount()

of every individual file-system (e.g., ext4_mount()).

>     But there is another problem I called as problem 2 in my last mail.
> That we can not distinguish:
>     -o - default behavior (*no atime*)
>     -o atime - atime support

-o atime does not mean anything from the kernel POW, it is only
user-space tools which may translate it to something meaningful for the
kernel. No file-systems can distinguish these two anyway. So I would say
this is not a problem, people have to use 'strictatime' instead.

What do you think about this as the alternative to the
UBIFS_ATIME_SUPPORT configuration switch, which will introduce
additional churn?
