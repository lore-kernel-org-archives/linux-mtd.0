Received: from smtp-sh.infomaniak.ch ([128.65.195.4])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e5zAt-0001pV-EG
 for linux-mtd@lists.infradead.org; Sat, 21 Oct 2017 19:11:13 +0000
From: nicolas@belouin.fr
Message-Id: <201710211909.v9LJ9Zg8033866@smtp6.infomaniak.ch>
Date: Sat, 21 Oct 2017 21:09:32 +0200
In-Reply-To: <20171021160302.GA2842@mail.hallyn.com>
References: <20171021134558.21195-1-nicolas@belouin.fr>
 <20171021160302.GA2842@mail.hallyn.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 1/2] security, capabilities: create CAP_TRUSTED
To: "Serge E. Hallyn" <serge@hallyn.com>
CC: Jan Kara <jack@suse.com>, "Theodore Ts'o" <tytso@mit.edu>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Dave Kleikamp <shaggy@kernel.org>, Mark Fasheh <mfasheh@versity.com>,
 Joel Becker <jlbec@evilplan.org>, Miklos Szeredi <miklos@szeredi.hu>,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Serge Hallyn <serge@hallyn.com>, Paul Moore <paul@paul-moore.com>,
 Stephen Smalley <sds@tycho.nsa.gov>,
 Eric Paris <eparis@parisplace.org>, James.Morris@smtp6.infomaniak.ch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

<james.l.morris@oracle.com>,linux-ext4@vger.kernel.org,linux-kernel@vger.kernel.org,linux-f2fs-devel@lists.sourceforge.net,linux-fsdevel@vger.kernel.org,linux-mtd@lists.infradead.org,jfs-discussion@lists.sourceforge.net,ocfs2-devel@oss.oracle.com,linux-unionfs@vger.kernel.org,reiserfs-devel@vger.kernel.org,linux-security-module@vger.kernel.org,selinux@tycho.nsa.gov,linux-api@vger.kernel.org,kernel-hardening@lists.openwall.com
From: Nicolas Belouin <nicolas@belouin.fr>
Message-ID: <99179B10-4EAE-4FAB-9D14-B885156261B3@belouin.fr>



On October 21, 2017 6:03:02 PM GMT+02:00, "Serge E=2E Hallyn" <serge@hally=
n=2Ecom> wrote:
>Quoting Nicolas Belouin (nicolas@belouin=2Efr):
>> with CAP_SYS_ADMIN being bloated, the usefulness of using it to
>> flag a process to be entrusted for e=2Eg reading and writing trusted
>> xattr is near zero=2E
>> CAP_TRUSTED aims to provide userland with a way to mark a process as
>> entrusted to do specific (not specially admin-centered) actions=2E It
>> would for example allow a process to red/write the trusted xattrs=2E
>
>You say "for example"=2E  Are you intending to add more uses?  If so,
>what
>are they?  If not, how about renaming it CAP_TRUSTED_XATTR?
>

I don't see any other use for now, but I don't want it to be too narrow an=
d non usable in a similar context in the future=2E So I believe the underly=
ing purpose of marking a process as "trusted" (even if for now it only mean=
s rw permission on trusted xattr) is more meaningful=2E

>What all does allowing writes to trusted xattrs give you?  There are
>the overlayfs whiteouts, what else?

Nicolas
