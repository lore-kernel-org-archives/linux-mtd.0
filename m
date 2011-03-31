Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5Ggo-0001vF-9v
	for linux-mtd@lists.infradead.org; Thu, 31 Mar 2011 12:09:27 +0000
Received: by ewy3 with SMTP id 3so771514ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 31 Mar 2011 05:09:24 -0700 (PDT)
Subject: Re: [PATCH] mtd: nand: Fixed null pointer dereference.
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Maarten ter Huurne <maarten@treewalker.org>
In-Reply-To: <1300286875-21426-1-git-send-email-maarten@treewalker.org>
References: <1300286875-21426-1-git-send-email-maarten@treewalker.org>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 31 Mar 2011 15:07:04 +0300
Message-ID: <1301573224.2828.50.camel@localhost>
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

On Wed, 2011-03-16 at 15:47 +0100, Maarten ter Huurne wrote:
> The "bd" argument of verify_bbt_descr() was dereferenced before it was checked for NULL.
> 
> Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>

Hi, this was fixed in upstream already by another person.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
