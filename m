Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16nDFN-0003KJ-00
	for <linux-mtd@lists.infradead.org>; Tue, 19 Mar 2002 06:37:25 +0000
Subject: Re: Initialization ordering problem
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: William Jhun <wjhun@ayrnetworks.com>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <20020318221449.L6821@ayrnetworks.com>
References: <20020318221449.L6821@ayrnetworks.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 19 Mar 2002 07:50:12 +0100
Message-Id: <1016520612.19504.3.camel@pcjonashg>
Mime-Version: 1.0
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Tue, 2002-03-19 at 07:14, William Jhun wrote:
> I could work up some kludge to make
> our platform-specific flash initialization code link in after the mtd
> code, but this would be ugly.

Why don't you want to change the link order? Isn't it logical to link in
the architecture independent parts before the architecture speficic ones
so that the arch specific code can use the frameworks in the arch
independent code?

/Jonas
