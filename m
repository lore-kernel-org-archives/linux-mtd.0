From: David Woodhouse <dwmw2@infradead.org>
To: Stuart Yoder <stuart.yoder@conformative.com>
In-Reply-To: <1105560166.30759.19.camel@baythorne.infradead.org>
References: <005401c4f8df$8be01350$2f010a0a@foundation.com>
	<1105560166.30759.19.camel@baythorne.infradead.org>
Content-Type: text/plain
Date: Wed, 12 Jan 2005 20:10:14 +0000
Message-Id: <1105560614.30759.21.camel@baythorne.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 mount time is really bad on 1st boot only
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-01-12 at 20:02 +0000, David Woodhouse wrote:
> It's probably erasing the unused part of the file system. Running with
> CONFIG_JFFS2_FS_DEBUG=1 should fix that. 

Doh.

s/fix that/show you that/

-- 
dwmw2
