Received: from wproxy.gmail.com ([64.233.184.197])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E9d2I-00043c-M1
	for linux-mtd@lists.infradead.org; Mon, 29 Aug 2005 02:22:29 -0400
Received: by wproxy.gmail.com with SMTP id i3so302384wra
	for <linux-mtd@lists.infradead.org>;
	Sun, 28 Aug 2005 23:22:22 -0700 (PDT)
Message-ID: <4312A854.5020109@gmail.com>
Date: Mon, 29 Aug 2005 09:16:52 +0300
From: gxkahn <gxkahn@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: module params for physycal memory map
Reply-To: gxkahn@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

i have NOR flash which works fine with CFI module.
currently linux kernel configured with start/length numbers to help 
recognize
physical flash. can it be done by module parameter?
