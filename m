Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zylt9-000655-6O
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2015 19:25:59 +0000
Received: by wmvv187 with SMTP id v187so244304190wmv.1
 for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2015 11:25:37 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20151117192141.GD108807@ubuntu-hedt>
References: <1447778351-118699-1-git-send-email-seth.forshee@canonical.com>
 <20151117170556.GV22011@ZenIV.linux.org.uk>
 <20151117172551.GA108807@ubuntu-hedt>
 <20151117175506.GW22011@ZenIV.linux.org.uk>
 <20151117183444.GB108807@ubuntu-hedt>
 <CAFLxGvx1UqJOhM3wqAGqT+TrkapeP1zkmg0a1K=DjySePx4mEA@mail.gmail.com>
 <20151117192141.GD108807@ubuntu-hedt>
Date: Tue, 17 Nov 2015 21:25:37 +0200
Message-ID: <CAE1zotLNq1v_ZegT9LyFsTiHWQnOAow+KKQFFvOYKUyRWPjfGA@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] User namespace mount updates
From: Octavian Purdila <octavian.purdila@intel.com>
To: Seth Forshee <seth.forshee@canonical.com>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 Al Viro <viro@zeniv.linux.org.uk>,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-bcache@vger.kernel.org,
 device-mapper development <dm-devel@redhat.com>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 LSM <linux-security-module@vger.kernel.org>,
 selinux@tycho.nsa.gov, Serge Hallyn <serge.hallyn@canonical.com>,
 Andy Lutomirski <luto@amacapital.net>, LKML <linux-kernel@vger.kernel.org>,
 "Theodore Ts'o" <tytso@mit.edu>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 17, 2015 at 9:21 PM, Seth Forshee
<seth.forshee@canonical.com> wrote:
>
> On Tue, Nov 17, 2015 at 08:12:31PM +0100, Richard Weinberger wrote:
> > On Tue, Nov 17, 2015 at 7:34 PM, Seth Forshee
> > <seth.forshee@canonical.com> wrote:
> > > On Tue, Nov 17, 2015 at 05:55:06PM +0000, Al Viro wrote:
> > >> On Tue, Nov 17, 2015 at 11:25:51AM -0600, Seth Forshee wrote:
> > >>
> > >> > Shortly after that I plan to follow with support for ext4. I've been
> > >> > fuzzing ext4 for a while now and it has held up well, and I'm currently
> > >> > working on hand-crafted attacks. Ted has commented privately (to others,
> > >> > not to me personally) that he will fix bugs for such attacks, though I
> > >> > haven't seen any public comments to that effect.
> > >>
> > >> _Static_ attacks, or change-image-under-mounted-fs attacks?
> > >
> > > Right now only static attacks, change-image-under-mounted-fs attacks
> > > will be next.
> >
> > Do we *really* need to enable unprivileged mounting of kernel filesystems?
> > What about just enabling fuse and implement ext4 and friends as fuse
> > filesystems?
> > Using the approaching Linux Kernel Libary[1] this is easy.
>
> I haven't looked at this project, but I'm guessing that programs must be
> written specifically to make use of it? I.e. you can't just use the
> mount syscall, and thus all existing software still doesn't work?
>

The projects includes a lklfuse program that uses fuse to mount a
fileystem image.
