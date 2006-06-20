Subject: Re: FAT vs jFFS2 for NAND.
From: David Woodhouse <dwmw2@infradead.org>
To: Claudio Lanconelli <lanconelli.claudio@eptar.com>
In-Reply-To: <4497DCA6.2080006@eptar.com>
References: <BAY110-F16C625F11A1D80EA24563ABC860@phx.gbl>
	<4497DCA6.2080006@eptar.com>
Content-Type: text/plain
Date: Tue, 20 Jun 2006 13:30:58 +0100
Message-Id: <1150806658.17609.55.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-06-20 at 13:31 +0200, Claudio Lanconelli wrote:
> I made some time ago a Smartmedia read only layer for MTD, since I
> can't make the current ssfdc.c working.
> I attach it if you want to give a look. 

Thanks. I think it makes a certain amount of sense to merge that --
people can add write support to it later. Please could you re-send with
a Signed-off-by: line so that it can be merged?

-- 
dwmw2
