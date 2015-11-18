Received: from mail-io0-x22d.google.com ([2607:f8b0:4001:c06::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zyqyh-0000b8-Gw
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2015 00:52:04 +0000
Received: by ioir85 with SMTP id r85so37752243ioi.1
 for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2015 16:51:41 -0800 (PST)
Date: Tue, 17 Nov 2015 18:50:52 -0600
From: Seth Forshee <seth.forshee@canonical.com>
To: James Morris <jmorris@namei.org>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>,
 Casey Schaufler <casey@schaufler-ca.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Serge Hallyn <serge.hallyn@canonical.com>,
 Andy Lutomirski <luto@amacapital.net>, linux-kernel@vger.kernel.org,
 linux-bcache@vger.kernel.org, dm-devel@redhat.com,
 linux-raid@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org,
 linux-security-module@vger.kernel.org, selinux@tycho.nsa.gov,
 James Morris <james.l.morris@oracle.com>,
 "Serge E. Hallyn" <serge@hallyn.com>
Subject: Re: [PATCH v3 7/7] Smack: Handle labels consistently in untrusted
 mounts
Message-ID: <20151118005052.GA131992@ubuntu-hedt>
References: <1447778351-118699-1-git-send-email-seth.forshee@canonical.com>
 <1447778351-118699-8-git-send-email-seth.forshee@canonical.com>
 <alpine.LRH.2.20.1511181112090.1460@namei.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LRH.2.20.1511181112090.1460@namei.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 18, 2015 at 11:12:51AM +1100, James Morris wrote:
> On Tue, 17 Nov 2015, Seth Forshee wrote:
> 
> > +	sbsp = inode->i_sb->s_security;
> > +	if ((sbsp->smk_flags & SMK_SB_UNTRUSTED) &&
> 
> Where is SMK_SB_UNTRUSTED defined?
> 
> I can't see it in this patch series, mainline or security next.

Eric's already applied a few of my patches to a branch in his tree,
including the one that defines this. See the for-testing branch of
git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.git,
specifically
https://git.kernel.org/cgit/linux/kernel/git/ebiederm/user-namespace.git/commit/?id=36979551f2345d4e20714c1fc53d6a15c87f8b64.

Thanks,
Seth
