Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZTmAO-0007JE-QD
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2015 07:27:41 +0000
Message-ID: <1440401215.15510.35.camel@gmail.com>
Subject: Re: [PATCH v2 23/35] ubifs: set/clear MS_RDONLY properly in
 ubifs_remount
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, Richard Weinberger
 <richard@nod.at>, viro@ZenIV.linux.org.uk, jack@suse.cz,
 richard.weinberger@gmail.com
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org
Date: Mon, 24 Aug 2015 10:26:55 +0300
In-Reply-To: <55DAC3C3.9050906@cn.fujitsu.com>
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438235311-23788-24-git-send-email-yangds.fnst@cn.fujitsu.com>
 <55C671F0.5050607@nod.at> <55C81090.1010802@cn.fujitsu.com>
 <55DA7379.3030009@cn.fujitsu.com> <1440399770.15510.20.camel@gmail.com>
 <55DAC3C3.9050906@cn.fujitsu.com>
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

On Mon, 2015-08-24 at 15:12 +0800, Dongsheng Yang wrote:
> On 08/24/2015 03:02 PM, Artem Bityutskiy wrote:
> > On Mon, 2015-08-24 at 09:29 +0800, Dongsheng Yang wrote:
> > > On 08/10/2015 10:46 AM, Dongsheng Yang wrote:
> > > > On 08/09/2015 05:17 AM, Richard Weinberger wrote:
> > > > > Am 30.07.2015 um 07:48 schrieb Dongsheng Yang:
> > > > > > We need to set or clear MS_RDONLY in remounting.
> > > > > 
> > > > > Care to explain why?
> > > > > Does the quota subsystem need that information?
> > > > > If so, where?
> > > > 
> > > > Ha, yes, you are right.
> > > > 
> > > > When we remount to rw from ro, we need to call dquot_resume.
> > > > And dquot_resume will call vfs_load_quota_inode() which
> > > > will check the MS_RDONLY. If it's ro mode, will return
> > > > an -EROFS.
> > > > 
> > > > And I know that we are using ->ro_mount in ubifs
> > > > to store the mounted mode. So we don't care about
> > > > the MS_RDONLY in ubifs. But why not to tell vfs we are in
> > > > ro or rw? Does it cause any problem?
> > > 
> > > Hi Artem,
> > > 	I found there is a commit 2ef13294d to introduce
> > > ro_mount to ubifs. Yes, I see the reason to use ro_mount
> > > rather than MS_RDONLY in ubifs. But why we do not set
> > > MS_RDONLY to tell vfs it's in rdonly or not? Current
> > > quota depends on it. Does this patch cause some problem?
> > 
> > MS_RDONLY is set at mount time, then it can be changed when we re
> > -mount, and then UBIFS can change it when there was a critical
> > error,
> > to ask VFS to stop writing more data to the file-system. See
> > 'ubifs_ro_mode()'.
> > 
> > The custom ro_mount is the same as MS_RDONLY, but it does not
> > change in
> > 'ubifs_ro_mode()'. It preserves the last mount state before the
> > error
> > happened - was it R/O or R/W.
> > 
> > Why is this needed?
> > 
> > UBIFS allocate different amount of resources depending on whether
> > we
> > are R/O or R/W. We use less memory in R/O mode, for example.
> > 
> > At unmount time, we need to know whether we allocated the "RW"
> > amount
> > of resources or the "RO" amount of resources.
> > 
> > We cannot use the MS_RDONLY flag to detect that, because it is
> > changed
> > in 'ubifs_ro_mode()' unconditionally, so we lose the information.
> > Therefore we use the custom ro_mount flag - it tells us how we were
> > mounted, so we know how much resources to free.
> 
> Great explanation!!! This makes it much more clear to me.
> 
> But about:
>  > MS_RDONLY is set at mount time, then it can be changed when we re
> 
> Currently, ubifs did not set it at mount time and ubifs did not
> change
> it in re-mounting. So vfs don't know the R/O or R/W mode of ubifs.

Well, sounds like a bug. Either we missed that, or VFS used to set it,
and now does not. In either case, IIUC, the MS_RDONLY flag should be
set on remount and reflect the mount state. Please, verify /proc/mounts
after RO<->RW remounts - we must make sure mount options are correct
there. You can cook a patch and send it. Do not forget to add the
stable tag then.

Artem.
