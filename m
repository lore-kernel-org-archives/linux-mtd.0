Received: from e31.co.us.ibm.com ([32.97.110.129])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CCMeQ-0001aL-5c
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2004 14:24:35 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1096390699.30942.110.camel@hades.cambridge.redhat.com>
References: <41595913.4040007@yandex.ru>
	<1096375038.30942.30.camel@hades.cambridge.redhat.com>
	<41596471.5020108@yandex.ru>
	<1096377761.30942.58.camel@hades.cambridge.redhat.com>
	<41596913.6080207@yandex.ru>
	<1096379132.30942.66.camel@hades.cambridge.redhat.com>
	<41596DDC.3000506@yandex.ru>
	<1096380254.30942.77.camel@hades.cambridge.redhat.com>
	<1096381863.17956.12.camel@weaponx.rchland.ibm.com>
	<41597985.3080803@yandex.ru>
	<1096383492.30942.83.camel@hades.cambridge.redhat.com>
	<415995EC.8010004@yandex.ru>
	<1096390699.30942.110.camel@hades.cambridge.redhat.com>
Content-Type: text/plain
Message-Id: <1096395862.3148.8.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Tue, 28 Sep 2004 13:24:22 -0500
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 an nodes checking
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-09-28 at 11:58, David Woodhouse wrote:
> > This is from SUSv3 fore read() call:
> > 
> > "Upon successful completion, where nbyte is greater than 0, read() shall 
> > mark for update the st_atime field of the file, and shall return the 
> > number of bytes read."
> 
> We don't do atime on JFFS2.

Thinking more about this...  why can't we do something similar for
[cm]time and special files, like fifos?  I remember a conversation on
IRC, but I don't remember the result.

josh
