From: David Woodhouse <dwmw2@infradead.org>
To: Jan Vestby <vestby@alfanett.no>
In-Reply-To: <200410192016.02411.vestby@alfanett.no>
References: <OF9C244FBD.F36AE939-ON85256F31.00585A10-85256F31.005A79E1@nanometrics.ca>
	<200410192016.02411.vestby@alfanett.no>
Content-Type: text/plain
Message-Id: <1098211369.3872.14.camel@baythorne.infradead.org>
Mime-Version: 1.0
Date: Tue, 19 Oct 2004 19:42:49 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 behaviour when large number of files are created.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-10-19 at 20:16 +0200, Jan Vestby wrote:
> I have seen startup time is quite nonlinear with respect to the number of 
> files per directory. You could try to restrict the size of directories.

Hm. Should we be using rbtrees for dirents too? Or will the snapshots
fix this anyway?
-- 
dwmw2
