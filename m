Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NznC0-0008VT-Lk
	for linux-mtd@lists.infradead.org; Thu, 08 Apr 2010 08:34:29 +0000
Subject: Re: [PATCH] mtd: Replace the dangerous to_fsl_upm_nand macro with
	an inline function
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ferenc Wagner <wferi@niif.hu>
In-Reply-To: <87iq8n0xvj.fsf@tac.ki.iif.hu>
References: <87iq8n0xvj.fsf@tac.ki.iif.hu>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 08 Apr 2010 11:32:31 +0300
Message-ID: <1270715551.6754.111.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-03-23 at 18:08 +0100, Ferenc Wagner wrote:
> The original macro worked only when applied to variables named 'mtd'.
> While this could have been fixed by simply renaming the macro argument,
> a more type-safe replacement is preferred.
> 
> Signed-off-by: Ferenc Wagner <wferi@niif.hu>

Pushed this and the other similar patch of yours to my l2-mtd-2.6.git /
master, thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
