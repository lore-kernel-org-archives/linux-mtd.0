Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUGnx-000103-Ul
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 11:20:10 +0000
Received: by fxm14 with SMTP id 14so316889fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 04:20:07 -0700 (PDT)
Subject: Re: [PATCH v2] flash_info: deprecate
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1307459497-2226-1-git-send-email-vapier@gentoo.org>
References: <1307427548-29306-6-git-send-email-vapier@gentoo.org>
	<1307459497-2226-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Jun 2011 14:15:50 +0300
Message-ID: <1307531750.31223.51.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-06-07 at 11:11 -0400, Mike Frysinger wrote:
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
> v2
> 	- just deprecate for now rather than straight up removal
> 
>  feature-removal-schedule.txt |    7 +++++++
>  flash_info.c                 |    2 ++
>  2 files changed, 9 insertions(+), 0 deletions(-)

Pushed to mtd-utils.git, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
