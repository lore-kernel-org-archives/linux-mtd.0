Received: from lotus.glocalnet.net ([213.163.128.201])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLfIn-0007gv-EW
	for linux-mtd@lists.infradead.org; Tue, 21 Mar 2006 06:45:41 -0500
To: linux-mtd@lists.infradead.org
References: <1142865089.c65a3380tomas2003@home.se>
	<Pine.LNX.4.64.0603201102430.3631@localhost.localdomain>
Message-ID: <ops6rhi7cvoeqxpi@privat.utfors.se>
From: Tomas <Tomas2003@home.se>
Content-Type: text/plain; format=flowed; charset=iso-8859-15
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Tue, 21 Mar 2006 12:43:45 +0100
In-Reply-To: <Pine.LNX.4.64.0603201102430.3631@localhost.localdomain>
Subject: Re: cfi 0001
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

There are 2 things that I didn't expect:

First that the flash allways seems to be in non-readable
state after a write. It will not change state until a read
is performed. This might be by design for performance?
The cfi-driver uses the buffered write and then
returns. Next time the cfi-driver is called it checks
if the operation done before was completed
and issue the current task?

The second thing is that it whole flash is put
into a non-readable state in a write operation.
I have partition the flash in several partition
by using physmap. I don't know how the cfi flash
works but shoudn't it be possible to work on sector basis?

Thanks in advance, Tomas
