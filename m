Received: from emvm-gh1-uea08.nsa.gov ([63.239.67.9] helo=nsa.gov)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SHxK4-0001oD-Nv
 for linux-mtd@lists.infradead.org; Wed, 11 Apr 2012 13:10:57 +0000
Subject: Re: [PATCH v2] Add security.* XATTR support for the UBIFS
From: Stephen Smalley <sds@tycho.nsa.gov>
To: Subodh Nijsure <subodh.nijsure@gmail.com>
In-Reply-To: <CALr9Q3Yto9VOhFNRQFVqP7Zi6RWWBaoDUu1zxsup7=+g7_pijQ@mail.gmail.com>
References: <1334015486-20616-1-git-send-email-snijsure@grid-net.com>
 <1334061985.23411.3.camel@moss-pluto>
 <CALr9Q3Yto9VOhFNRQFVqP7Zi6RWWBaoDUu1zxsup7=+g7_pijQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 11 Apr 2012 09:10:53 -0400
Message-ID: <1334149853.14296.29.camel@moss-pluto>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Subodh Nijsure <snijsure@grid-net.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, linux-kernel@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, linux-security-module@vger.kernel.org,
 linux-mtd@lists.infradead.org, casey@schaufler-ca.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2012-04-11 at 06:00 -0700, Subodh Nijsure wrote:
> On Tue, Apr 10, 2012 at 5:46 AM, Stephen Smalley <sds@tycho.nsa.gov> wrote:
> > On Mon, 2012-04-09 at 16:51 -0700, subodh.nijsure@gmail.com wrote:
> >> From: Subodh Nijsure <snijsure@grid-net.com>
> >>
> >> Also fix couple of bugs in UBIFS extended attribute length calculation.
> >>
> >> Changes Since V1:
> >>          Instead of just handling security.selinux extended attribute handle
> >>          all security.* attributes.
> >>
> >> TESTING: Tested on  MX28 based platforms using Micron MT29F2G08ABAEAH4 NAND
> >>          With these change we are able to label UBIFS filesystem with
> >>          security.selinux and run system with selinux enabled.
> >>          This change also allows one to set other security.* extended
> >>          attributesr, such as security.smack security.evm, security.ima
> >>          Ran integck test on UBI filesystem.
> >>
> >> Signed-off-by: Subodh Nijsure <snijsure@grid-net.com>
> >> ---
> >>  fs/ubifs/dir.c     |    4 ++
> >>  fs/ubifs/file.c    |    6 ++
> >>  fs/ubifs/journal.c |   12 +++-
> >>  fs/ubifs/super.c   |    3 +
> >>  fs/ubifs/ubifs.h   |    9 +++
> >>  fs/ubifs/xattr.c   |  147 ++++++++++++++++++++++++++++++++++++++++++++++++----
> >>  6 files changed, 167 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/fs/ubifs/dir.c b/fs/ubifs/dir.c
> >> index ec9f187..f4e06c4 100644
> >> --- a/fs/ubifs/dir.c
> >> +++ b/fs/ubifs/dir.c
> >> @@ -293,6 +293,7 @@ static int ubifs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
> >>       ubifs_release_budget(c, &req);
> >>       insert_inode_hash(inode);
> >>       d_instantiate(dentry, inode);
> >> +     ubifs_init_security(dir, inode, &dentry->d_name);
> >>       return 0;
> >>
> >>  out_cancel:
> >
> > The ubifs_init_security() should occur before d_instantiate() so that
> > the inode is not accessible to other threads before its security
> > attributes have been set.  And if it fails, you would ideally drop the
> > inode altogether and return an error to the creating process.
> >
> 
> I will look into moving ubifs_init_security() before d_instantiate().
> Last time I had tried I had run into some issues and had to keep
> creating inode and then creating xattr as two seperate items. I will
> look through the UBIFS code that actually creates xattr ubi nodes.
> Also I will wait for couple of days to send v3 patch with to see if
> mtd folks have other comments this patch.

I'd favor moving the call to ubifs_init_security() inside of
ubifs_new_inode() so that it gets done as part of all inode creation.
To do that, you'll need to pass the &dentry->d_name (const struct qstr
*) down to ubifs_new_inode(). But you can see that it is done that way
for ext4_new_inode(), for example.

-- 
Stephen Smalley
National Security Agency
