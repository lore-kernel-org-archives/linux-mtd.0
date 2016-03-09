Received: from mail-ob0-x22c.google.com ([2607:f8b0:4003:c01::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1adfPo-0003JU-0o
 for linux-mtd@lists.infradead.org; Wed, 09 Mar 2016 14:48:45 +0000
Received: by mail-ob0-x22c.google.com with SMTP id fp4so48611163obb.2
 for <linux-mtd@lists.infradead.org>; Wed, 09 Mar 2016 06:48:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20160309141840.GC23399@ubuntu-xps13>
References: <1451930639-94331-1-git-send-email-seth.forshee@canonical.com>
 <1451930639-94331-17-git-send-email-seth.forshee@canonical.com>
 <20160309112923.GF8655@tucsk> <20160309141840.GC23399@ubuntu-xps13>
Date: Wed, 9 Mar 2016 15:48:22 +0100
Message-ID: <CAJfpegv5JmB15yHpjYxVeOYdWWkoLMftr9-e_iS93Y_7m=t4Zw@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 16/18] fuse: Support fuse filesystems outside of
 init_user_ns
From: Miklos Szeredi <miklos@szeredi.hu>
To: Seth Forshee <seth.forshee@canonical.com>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Serge Hallyn <serge.hallyn@canonical.com>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Austin S Hemmelgarn <ahferroin7@gmail.com>,
 Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-bcache@vger.kernel.org,
 dm-devel@redhat.com, linux-raid@vger.kernel.org,
 linux-mtd@lists.infradead.org, Linux-Fsdevel <linux-fsdevel@vger.kernel.org>,
 fuse-devel <fuse-devel@lists.sourceforge.net>,
 LSM <linux-security-module@vger.kernel.org>, selinux@tycho.nsa.gov
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 9, 2016 at 3:18 PM, Seth Forshee <seth.forshee@canonical.com> wrote:
> On Wed, Mar 09, 2016 at 12:29:23PM +0100, Miklos Szeredi wrote:
>> On Mon, Jan 04, 2016 at 12:03:55PM -0600, Seth Forshee wrote:

>> > -static int parse_fuse_opt(char *opt, struct fuse_mount_data *d, int is_bdev)
>> > +static int parse_fuse_opt(char *opt, struct fuse_mount_data *d, int is_bdev,
>> > +                     struct user_namespace *user_ns)
>> >  {
>> >     char *p;
>> >     memset(d, 0, sizeof(struct fuse_mount_data));
>> >     d->max_read = ~0;
>> >     d->blksize = FUSE_DEFAULT_BLKSIZE;
>> > +   d->user_id = make_kuid(user_ns, 0);
>> > +   d->group_id = make_kgid(user_ns, 0);
>>
>> It is true that if "user_id=" or "group_id" options were omitted we used the
>> zero uid/gid values.  However, this isn't actually used by anybody AFAIK, and
>> generalizing it for userns doesn't seem to make much sense.
>>
>> So I suggest we that we instead return an error if mounting from a userns AND
>> neither "allow_other" nor both "user_id" and "group_id" are specified.
>
> But those are also used for ownership of the connection files in
> fusectl. In an allow_other mount shouldn't those files by owned by
> namespace root and not global root?

Yes.

Can't we use current_cred()->uid/gid? Or fsuid/fsgid maybe?

When we have true unprivileged mounts, the user_id/group_id options
become redundant anyway and we can just use the current credentials.

Thanks,
Miklos
