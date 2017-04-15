Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1czKxG-00046w-BY
 for linux-mtd@lists.infradead.org; Sat, 15 Apr 2017 10:29:24 +0000
Received: by mail-oi0-x242.google.com with SMTP id t63so20685982oih.0
 for <linux-mtd@lists.infradead.org>; Sat, 15 Apr 2017 03:29:01 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <CABeXuvoKmvbo_n3XQ0Y+iWGz88Jr3TwbPA7GiR3pia9407ANLw@mail.gmail.com>
References: <1491613030-11599-1-git-send-email-deepa.kernel@gmail.com>
 <1491613030-11599-7-git-send-email-deepa.kernel@gmail.com>
 <CAHC9VhTYWeKL+BAb6F3tfwzs7OKUEA8ANM=V05sfoiahNNX=9w@mail.gmail.com>
 <CABeXuvoKmvbo_n3XQ0Y+iWGz88Jr3TwbPA7GiR3pia9407ANLw@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 15 Apr 2017 10:29:00 +0000
Message-ID: <CAK8P3a3w_3JKxW6kz-V9roxzf9RwbVgHaK8XjO5OOktVvZ_Sog@mail.gmail.com>
Subject: Re: [PATCH 06/12] audit: Use timespec64 to represent audit timestamps
To: Deepa Dinamani <deepa.kernel@gmail.com>
Cc: Paul Moore <paul@paul-moore.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Greg KH <gregkh@linuxfoundation.org>, "Dilger,
 Andreas" <andreas.dilger@intel.com>,
 "J. Bruce Fields" <bfields@fieldses.org>, Chris Mason <clm@fb.com>,
 "David S. Miller" <davem@davemloft.net>, David Sterba <dsterba@suse.com>,
 Evgeniy Dushistov <dushistov@mail.ru>, Eric Paris <eparis@redhat.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 Josef Bacik <jbacik@fb.com>, Jeff Layton <jlayton@poochiereds.net>,
 John Stultz <john.stultz@linaro.org>, James Simmons <jsimmons@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, "Drokin, Oleg" <oleg.drokin@intel.com>,
 Steven Rostedt <rostedt@goodmis.org>, yuchao0@huawei.com,
 ceph-devel <ceph-devel@vger.kernel.org>, devel@driverdev.osuosl.org,
 linux-audit@redhat.com, linux-btrfs <linux-btrfs@vger.kernel.org>,
 linux-cifs@vger.kernel.org,
 "Linux F2FS DEV, Mailing List" <linux-f2fs-devel@lists.sourceforge.net>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 LSM List <linux-security-module@vger.kernel.org>,
 Lustre Development List <lustre-devel@lists.lustre.org>,
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

On Sat, Apr 8, 2017 at 5:58 PM, Deepa Dinamani <deepa.kernel@gmail.com> wrote:
>> I have no problem merging this patch into audit/next for v4.12, would
>> you prefer me to do that so at least this patch is merged?
>
> This would be fine.
> But, I think whoever takes the last 2 deletion patches should also take them.
> I'm not sure how that part works out.
>
>> It would probably make life a small bit easier for us in the audit
>> world too as it would reduce the potential merge conflict.  However,
>> that's a relatively small thing to worry about.

As Andrew has picked the remaining patches up into -mm, this will work
out fine: any patches picked up by the respective maintainers for v4.12
should arrive as git pull requests before the -mm patches get applied
at a later stage of the merge window.

     Arnd
