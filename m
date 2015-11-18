Received: from tundra.namei.org ([65.99.196.166] helo=namei.org)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyqD4-0001uz-6O
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2015 00:02:50 +0000
Date: Wed, 18 Nov 2015 11:02:25 +1100 (AEDT)
From: James Morris <jmorris@namei.org>
To: Seth Forshee <seth.forshee@canonical.com>
cc: "Eric W. Biederman" <ebiederm@xmission.com>,
 Paul Moore <paul@paul-moore.com>, Stephen Smalley <sds@tycho.nsa.gov>,
 Eric Paris <eparis@parisplace.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Serge Hallyn <serge.hallyn@canonical.com>,
 Andy Lutomirski <luto@amacapital.net>, linux-kernel@vger.kernel.org,
 linux-bcache@vger.kernel.org, dm-devel@redhat.com,
 linux-raid@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org,
 selinux@tycho.nsa.gov, James Morris <james.l.morris@oracle.com>,
 "Serge E. Hallyn" <serge@hallyn.com>
Subject: Re: [PATCH v3 5/7] selinux: Add support for unprivileged mounts from
 user namespaces
In-Reply-To: <1447778351-118699-6-git-send-email-seth.forshee@canonical.com>
Message-ID: <alpine.LRH.2.20.1511181101290.1460@namei.org>
References: <1447778351-118699-1-git-send-email-seth.forshee@canonical.com>
 <1447778351-118699-6-git-send-email-seth.forshee@canonical.com>
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

On Tue, 17 Nov 2015, Seth Forshee wrote:

> Security labels from unprivileged mounts in user namespaces must
> be ignored. Force superblocks from user namespaces whose labeling
> behavior is to use xattrs to use mountpoint labeling instead.
> For the mountpoint label, default to converting the current task
> context into a form suitable for file objects, but also allow the
> policy writer to specify a different label through policy
> transition rules.
> 
> Pieced together from code snippets provided by Stephen Smalley.
> 
> Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
> Acked-by: Stephen Smalley <sds@tycho.nsa.gov>


Acked-by: James Morris <james.l.morris@oracle.com>

-- 
James Morris
<jmorris@namei.org>
