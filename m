Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUYkL-0000aO-8S
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 06:29:37 +0000
Received: by ewy3 with SMTP id 3so528823ewy.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 23:29:35 -0700 (PDT)
Subject: Re: [PATCH v4] mtdinfo: add regioninfo/eraseblock map display
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1307560292-29595-1-git-send-email-vapier@gentoo.org>
References: <1307559742-29134-1-git-send-email-vapier@gentoo.org>
	<1307560292-29595-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 09 Jun 2011 09:25:17 +0300
Message-ID: <1307600717.7374.2.camel@localhost>
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

On Wed, 2011-06-08 at 15:11 -0400, Mike Frysinger wrote:
> This brings the mtdinfo utility in line with the functionality
> of the flash_info utility.  It dumps the erase regioninfo (if
> the devices has it) as well as showing a handy eraseblock map
> (if the user has requested it).  The eraseblock map also shows
> which blocks are locked and which ones are bad.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> ---
> v4
> 	- still show region info when map isn't requested
> 

Looks good, quick test with nandsim also looks good, pushed, thanks a
lot!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
