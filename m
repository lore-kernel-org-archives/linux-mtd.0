Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M8Uwc-0000nO-1N
	for linux-mtd@lists.infradead.org; Mon, 25 May 2009 07:50:08 +0000
Subject: Re: [PATCH 1/2] mkfs.ubifs: remove duplicated code
From: Artem Bityutskiy <dedekind@infradead.org>
To: Corentin Chary <corentincj@iksaif.net>
In-Reply-To: <1243232787-29108-2-git-send-email-corentincj@iksaif.net>
References: <1243232787-29108-1-git-send-email-corentincj@iksaif.net>
	<1243232787-29108-2-git-send-email-corentincj@iksaif.net>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 25 May 2009 10:49:49 +0300
Message-Id: <1243237789.21646.55.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-05-25 at 08:26 +0200, Corentin Chary wrote:
> ino->uid        = cpu_to_le32(st->st_uid);
> ino->gid        = cpu_to_le32(st->st_gid);
> was present twice.
> 
> Signed-off-by: Corentin Chary <corentincj@iksaif.net>

Pushed this one, thanks.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
