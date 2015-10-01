Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zhe1H-0001xe-Ao
 for linux-mtd@lists.infradead.org; Thu, 01 Oct 2015 13:35:35 +0000
Message-ID: <1443706510.16309.52.camel@gmail.com>
Subject: Re: [PATCH] fs/ubifs: remove unnecessary new_valid_dev check
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard.weinberger@gmail.com>, Yaowei Bai
 <bywxiaobai@163.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Adrian Hunter
 <adrian.hunter@intel.com>,  "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, linux-fsdevel
 <linux-fsdevel@vger.kernel.org>,  LKML <linux-kernel@vger.kernel.org>
Date: Thu, 01 Oct 2015 16:35:10 +0300
In-Reply-To: <CAFLxGvwdvW8k07ENLQP7PyXrznVf0UKsnZMUCGahULqsDrgfGQ@mail.gmail.com>
References: <1443446807-4838-1-git-send-email-bywxiaobai@163.com>
 <1443535053-4673-1-git-send-email-bywxiaobai@163.com>
 <CAFLxGvwdvW8k07ENLQP7PyXrznVf0UKsnZMUCGahULqsDrgfGQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2015-09-30 at 10:11 +0200, Richard Weinberger wrote:
> >  {
> > -       if (new_valid_dev(rdev)) {
> > -               dev->new = cpu_to_le32(new_encode_dev(rdev));
> > -               return sizeof(dev->new);
> > -       } else {
> > -               dev->huge = cpu_to_le64(huge_encode_dev(rdev));
> > -               return sizeof(dev->huge);
> > -       }
> > +       dev->new = cpu_to_le32(new_encode_dev(rdev));
> > +       return sizeof(dev->new);
> >  }
> 
> Reviewed-by: Richard Weinberger <richard@nod.at>

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
