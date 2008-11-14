Received: from mx2.redhat.com ([66.187.237.31])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L10iV-00030T-Gy
	for linux-mtd@lists.infradead.org; Fri, 14 Nov 2008 15:36:15 +0000
Subject: Re: [PATCH] filesystems: use has_capability_noaudit interface for
	reserved blocks checks
From: Eric Paris <eparis@redhat.com>
To: Artem Bityutskiy <dedekind@yandex.ru>
In-Reply-To: <491D2F09.3070104@yandex.ru>
References: <1226430769.3353.5.camel@localhost.localdomain>
	<491D2F09.3070104@yandex.ru>
Content-Type: text/plain
Date: Fri, 14 Nov 2008 10:36:01 -0500
Message-Id: <1226676961.3353.78.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: adilger@sun.com, tytso@mit.edu, ext-adrian.hunter@nokia.com, sct@redhat.com,
	linux-kernel@vger.kernel.org, jmorris@namei.org,
	linux-mtd@lists.infradead.org, dushistov@mail.ru,
	akpm@linux-foundation.org, linux-ext4@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2008-11-14 at 09:55 +0200, Artem Bityutskiy wrote:
> Eric Paris wrote:
> > ext[2,3,4], ufs, and ubifs all check for  CAP_SYS_RESOURCE to determine
> > if they should allow reserved blocks to be used.  A process not having
> > this capability is not failing some security decision and should not be
> > audited.  Thus move to using has_capability_noaudit.
> > 
> > Signed-off-by: Eric Paris <eparis@redhat.com>
> > ---
> 
> UBIFS part looks OK, as long as the whole idea of the patch is right, which
> I have not checked, but assume it is.
> 
> The only question is are you sure exporting 'cap_capable()' is relevant
> to this patch? You do not seem to call it directly.

After this change, modules call has_capability_noaudit() which is a
#define which turns this into modules calling
security_capable_noaudit().  You noticed this and decided it was correct
to make that export.  But when CONFIG_SECURITY is not set
security_capable_notaudit() is a static inline which calls
cap_capable().  See include/linux/security.h line 2832 in the linux-next
tree.  Now modules are calling cap_capable directly, thus the export.

-Eric
