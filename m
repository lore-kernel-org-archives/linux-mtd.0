Received: from mail-la0-f47.google.com ([209.85.215.47])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZeNuJ-0006hN-I4
 for linux-mtd@lists.infradead.org; Tue, 22 Sep 2015 13:46:56 +0000
Received: by lahg1 with SMTP id g1so13045495lah.1
 for <linux-mtd@lists.infradead.org>; Tue, 22 Sep 2015 06:46:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvxrm1E696hSJ6GtnC-V16uWFWBU036a-Aak8PW43us69A@mail.gmail.com>
References: <1442924812-9384-1-git-send-email-agruenba@redhat.com>
 <1442924812-9384-2-git-send-email-agruenba@redhat.com>
 <CAFLxGvxrm1E696hSJ6GtnC-V16uWFWBU036a-Aak8PW43us69A@mail.gmail.com>
Date: Tue, 22 Sep 2015 14:47:08 +0200
Message-ID: <CAHc6FU4TB8sTNRZ+X5BGwcXJzrEQsOSu4ajdH1i3vzJJ5U-9vw@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] ubifs: Remove unused security xattr handler
From: Andreas Gruenbacher <agruenba@redhat.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christoph Hellwig <hch@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Subodh Nijsure <snijsure@grid-net.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2015-09-22 14:41 GMT+02:00 Richard Weinberger <richard.weinberger@gmail.com>:
> Should this go through the ubifs tree or do you carry it?

I hope that Al will take these patches from me. The filesystem patches
are not so exciting from a filesystem point of view.

Thanks,
Andreas
