From: David Woodhouse <dwmw2@infradead.org>
To: Chris Ellec <cellec@celerity.net>
In-Reply-To: <3F9EA810.6010905@celerity.net>
References: <3F9EA810.6010905@celerity.net>
Content-Type: text/plain
Message-Id: <1068053007.6065.453.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 05 Nov 2003 17:23:27 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: Dave Dillow <ddillow@idleaire.com>
Subject: Re: INFTL problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-10-28 at 09:32 -0800, Chris Ellec wrote:
> Hello,
> 
> I have a WinSystems devel board with a DOC on it. Dinfo from MSystems 
> reports a DOC 2000 at address D800 with 256 MB and an INFTL format.
> 
> I apllied the latest CVS patches to 2.4.22, but I can't seem to detect 
> the chip.

OK, I've applied Dave's patches, having checked that they don't break
the Millennium support. Please could you let us know whether what's in
CVS works for you now?

-- 
dwmw2
