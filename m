Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKTdq-0001EA-7I
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 11:01:14 +0000
Received: by ewy3 with SMTP id 3so457842ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 04:01:12 -0700 (PDT)
Subject: Re: [PATCH 2/2] UBIFS: fix-up free space on mount if flag is set
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
In-Reply-To: <1304722703-7904-3-git-send-email-mlcreech@gmail.com>
References: <1304722703-7904-1-git-send-email-mlcreech@gmail.com>
	<1304722703-7904-3-git-send-email-mlcreech@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 May 2011 13:57:50 +0300
Message-ID: <1305197870.2713.95.camel@localhost>
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

On Fri, 2011-05-06 at 18:58 -0400, Matthew L. Creech wrote:
> If a UBIFS filesystem is being mounted read-write, or is being remounted
> from read-only to read-write, check for the "space_fixup" flag and fix
> all LEBs containing empty space if necessary.
> 
> Signed-off-by: Matthew L. Creech <mlcreech@gmail.com>

Pushed to l2-mtd-2.6.git, thanks!

Also, it would be nice to have a piece of documentation for this feature
in the mtd web site - could you cook a patch for that too please? And
please, add links to this doc from other relevant places - you posted
links AFAIR.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
