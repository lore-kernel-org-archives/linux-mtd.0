Date: Thu, 13 Nov 2008 14:53:16 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Eric Paris <eparis@redhat.com>
Subject: Re: [PATCH] filesystems: use has_capability_noaudit interface for
	reserved blocks checks
Message-Id: <20081113145316.e53858bd.akpm@linux-foundation.org>
In-Reply-To: <1226430769.3353.5.camel@localhost.localdomain>
References: <1226430769.3353.5.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: adilger@sun.com, tytso@mit.edu, ext-adrian.hunter@nokia.com, sct@redhat.com,
	linux-kernel@vger.kernel.org, jmorris@namei.org,
	linux-mtd@lists.infradead.org, dushistov@mail.ru,
	linux-ext4@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 11 Nov 2008 14:12:49 -0500
Eric Paris <eparis@redhat.com> wrote:

> ext[2,3,4], ufs, and ubifs all check for  CAP_SYS_RESOURCE to determine
> if they should allow reserved blocks to be used.  A process not having
> this capability is not failing some security decision and should not be
> audited.  Thus move to using has_capability_noaudit.
> 
> Signed-off-by: Eric Paris <eparis@redhat.com>
> ---
> 
> I would like to push this patch through the security tree (since that's
> the only place the new cap_noaudit interface exists), but I'd like to
> get an ACK from each subsystem maintainer.

OK by me.

Whoever added has_capability_noaudit() forgot to document it, so the
difference between has_capability_noaudit() and has_capability() eludes
this reader.
