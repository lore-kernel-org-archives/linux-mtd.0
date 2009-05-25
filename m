Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M8Ufu-0007BP-Cn
	for linux-mtd@lists.infradead.org; Mon, 25 May 2009 07:32:53 +0000
Subject: Re: [PATCH] UBIFS: Add an error code if the compr is not present
From: Artem Bityutskiy <dedekind@infradead.org>
To: Corentin Chary <corentincj@iksaif.net>
In-Reply-To: <1243234150-29786-1-git-send-email-corentincj@iksaif.net>
References: <1243234150-29786-1-git-send-email-corentincj@iksaif.net>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 25 May 2009 10:32:37 +0300
Message-Id: <1243236757.21646.54.camel@localhost.localdomain>
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

On Mon, 2009-05-25 at 08:49 +0200, Corentin Chary wrote:
> If the compressor is not present, mount_ubifs need
> to return an error code. This way ubifs_fill_super
> will stop and handle the error.
> 
> Signed-off-by: Corentin Chary <corentincj@iksaif.net>

Pushed to ubifs-2.6.git, thank you!

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
