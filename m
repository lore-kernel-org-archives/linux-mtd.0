Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NxJwO-0004tc-Q8
	for linux-mtd@lists.infradead.org; Thu, 01 Apr 2010 12:56:09 +0000
Subject: Re: [PATCH, mtd-utils] creat(2) expects a creation mode parameter,
	not an open flag
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ferenc Wagner <wferi@niif.hu>
In-Reply-To: <87sk8bzvch.fsf@tac.ki.iif.hu>
References: <87sk8bzvch.fsf@tac.ki.iif.hu>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 01 Apr 2010 15:51:43 +0300
Message-ID: <1270126303.15073.64.camel@localhost>
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

On Sun, 2010-03-07 at 22:15 +0100, Ferenc Wagner wrote:
> creat(2) expects a creation mode parameter, not an open flag

Pushed to the mtd-utils tree, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
