Received: from tundra.namei.org ([65.99.196.166] helo=namei.org)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzJwH-0005ZL-LY
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2015 07:47:30 +0000
Date: Thu, 19 Nov 2015 18:47:00 +1100 (AEDT)
From: James Morris <jmorris@namei.org>
To: Richard Weinberger <richard.weinberger@gmail.com>
cc: Al Viro <viro@zeniv.linux.org.uk>,
 Seth Forshee <seth.forshee@canonical.com>,
 Austin S Hemmelgarn <ahferroin7@gmail.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-bcache@vger.kernel.org,
 device-mapper development <dm-devel@redhat.com>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 LSM <linux-security-module@vger.kernel.org>, selinux@tycho.nsa.gov,
 Serge Hallyn <serge.hallyn@canonical.com>,
 Andy Lutomirski <luto@amacapital.net>,
 LKML <linux-kernel@vger.kernel.org>, "Theodore Ts'o" <tytso@mit.edu>
Subject: Re: [PATCH v3 0/7] User namespace mount updates
In-Reply-To: <CAFLxGvwwhXqVM71m1kEDTZk_YTKGtbJ3gWoXw3wRgcwDiC38Bg@mail.gmail.com>
Message-ID: <alpine.LRH.2.20.1511191845510.10804@namei.org>
References: <20151117172551.GA108807@ubuntu-hedt>
 <20151117175506.GW22011@ZenIV.linux.org.uk> <564B79B1.3040207@gmail.com>
 <20151117191606.GC108807@ubuntu-hedt> <564B941A.2070601@gmail.com>
 <20151117213255.GE108807@ubuntu-hedt> <564C6DD4.6090308@gmail.com>
 <20151118142238.GB134139@ubuntu-hedt>
 <20151118145818.GC22011@ZenIV.linux.org.uk>
 <20151118150512.GE134139@ubuntu-hedt>
 <20151118151335.GD22011@ZenIV.linux.org.uk>
 <CAFLxGvwwhXqVM71m1kEDTZk_YTKGtbJ3gWoXw3wRgcwDiC38Bg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 18 Nov 2015, Richard Weinberger wrote:

> On Wed, Nov 18, 2015 at 4:13 PM, Al Viro <viro@zeniv.linux.org.uk> wrote:
> > On Wed, Nov 18, 2015 at 09:05:12AM -0600, Seth Forshee wrote:
> >
> >> Yes, the host admin. I'm not talking about trusting the admin inside the
> >> container at all.
> >
> > Then why not have the same host admin just plain mount it when setting the
> > container up and be done with that?  From the host namespace, before spawning
> > the docker instance or whatever framework you are using.  IDGI...
> 
> Because hosting companies sell containers as "full virtual machines"
> and customers expect to be able mount stuff like disk images they upload.

I don't think this is a valid reason for merging functionality into the 
kernel.


-- 
James Morris
<jmorris@namei.org>
