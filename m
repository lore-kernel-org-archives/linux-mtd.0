Received: from mail-it0-x242.google.com ([2607:f8b0:4001:c0b::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cwud1-0004Sy-Rd
 for linux-mtd@lists.infradead.org; Sat, 08 Apr 2017 17:58:29 +0000
Received: by mail-it0-x242.google.com with SMTP id a140so1768908ita.3
 for <linux-mtd@lists.infradead.org>; Sat, 08 Apr 2017 10:58:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAHC9VhTYWeKL+BAb6F3tfwzs7OKUEA8ANM=V05sfoiahNNX=9w@mail.gmail.com>
References: <1491613030-11599-1-git-send-email-deepa.kernel@gmail.com>
 <1491613030-11599-7-git-send-email-deepa.kernel@gmail.com>
 <CAHC9VhTYWeKL+BAb6F3tfwzs7OKUEA8ANM=V05sfoiahNNX=9w@mail.gmail.com>
From: Deepa Dinamani <deepa.kernel@gmail.com>
Date: Sat, 8 Apr 2017 10:58:05 -0700
Message-ID: <CABeXuvoKmvbo_n3XQ0Y+iWGz88Jr3TwbPA7GiR3pia9407ANLw@mail.gmail.com>
Subject: Re: [PATCH 06/12] audit: Use timespec64 to represent audit timestamps
To: Paul Moore <paul@paul-moore.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Greg KH <gregkh@linuxfoundation.org>, andreas.dilger@intel.com,
 Arnd Bergmann <arnd@arndb.de>, "J. Bruce Fields" <bfields@fieldses.org>,
 Chris Mason <clm@fb.com>,
 "David S. Miller" <davem@davemloft.net>, David Sterba <dsterba@suse.com>,
 Evgeniy Dushistov <dushistov@mail.ru>, Eric Paris <eparis@redhat.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 Josef Bacik <jbacik@fb.com>, Jeff Layton <jlayton@poochiereds.net>,
 John Stultz <john.stultz@linaro.org>, James Simmons <jsimmons@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, oleg.drokin@intel.com,
 Steven Rostedt <rostedt@goodmis.org>, yuchao0@huawei.com,
 ceph-devel <ceph-devel@vger.kernel.org>, devel@driverdev.osuosl.org,
 linux-audit@redhat.com, linux-btrfs <linux-btrfs@vger.kernel.org>,
 linux-cifs@vger.kernel.org,
 "Linux F2FS DEV, Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 LSM List <linux-security-module@vger.kernel.org>, lustre-devel@lists.lustre.org,
 Linux Network Devel Mailing List <netdev@vger.kernel.org>,
 samba-technical@lists.samba.org,
 y2038 Mailman List <y2038@lists.linaro.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> I have no problem merging this patch into audit/next for v4.12, would
> you prefer me to do that so at least this patch is merged?

This would be fine.
But, I think whoever takes the last 2 deletion patches should also take them.
I'm not sure how that part works out.

> It would probably make life a small bit easier for us in the audit
> world too as it would reduce the potential merge conflict.  However,
> that's a relatively small thing to worry about.

-Deepa
