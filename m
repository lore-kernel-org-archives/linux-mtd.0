Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CU76E-0001bY-5G
	for linux-mtd@lists.infradead.org; Tue, 16 Nov 2004 12:26:40 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: Domenico DI TULLIO <domenico.di-tullio@st.com>
In-Reply-To: <001001c4cc00$cc1ee6a0$a83682a4@nap.st.com>
References: <001001c4cc00$cc1ee6a0$a83682a4@nap.st.com>
Content-Type: text/plain
Date: Tue, 16 Nov 2004 18:18:00 +0100
Message-Id: <1100625480.5074.155.camel@thomas>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Mtd for NAND with page 2112k
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-11-16 at 18:22 +0100, Domenico DI TULLIO wrote:
> Dear all,
> 
> I have a question. Do the MTD version - 19 sept. 2004 support also page 2112K for NAND device?
> If no, there is another version that support this feature?

Do you mean 2048 Byte page size + 64 Byte OOB size ?

Yes, it's supported, but I recommend to used the latest code from MTD
CVS.

tglx
