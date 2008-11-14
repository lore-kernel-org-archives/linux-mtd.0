Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L0tZI-00034O-VB
	for linux-mtd@lists.infradead.org; Fri, 14 Nov 2008 07:58:17 +0000
Message-ID: <491D2F09.3070104@yandex.ru>
Date: Fri, 14 Nov 2008 09:55:53 +0200
From: Artem Bityutskiy <dedekind@yandex.ru>
MIME-Version: 1.0
To: Eric Paris <eparis@redhat.com>
Subject: Re: [PATCH] filesystems: use has_capability_noaudit interface for
	reserved blocks checks
References: <1226430769.3353.5.camel@localhost.localdomain>
In-Reply-To: <1226430769.3353.5.camel@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Eric Paris wrote:
> ext[2,3,4], ufs, and ubifs all check for  CAP_SYS_RESOURCE to determine
> if they should allow reserved blocks to be used.  A process not having
> this capability is not failing some security decision and should not be
> audited.  Thus move to using has_capability_noaudit.
> 
> Signed-off-by: Eric Paris <eparis@redhat.com>
> ---

UBIFS part looks OK, as long as the whole idea of the patch is right, which
I have not checked, but assume it is.

The only question is are you sure exporting 'cap_capable()' is relevant
to this patch? You do not seem to call it directly.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
