From: David Woodhouse <dwmw2@infradead.org>
To: Benny Chen <bennyc@rtunet.com>
In-Reply-To: <1125985969.4419.63.camel@Vigor4>
References: <1125888149.24477.32.camel@Vigor4>
	<200509050845.00348.david.jander@protonic.nl>
	<ad39a30f05090501553458af6e@mail.gmail.com>
	<200509051346.54202.david.jander@protonic.nl>
	<1125985969.4419.63.camel@Vigor4>
Content-Type: text/plain
Date: Tue, 06 Sep 2005 07:45:31 +0100
Message-Id: <1125989132.27347.8.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Leon Zhang <leoncamel@gmail.com>, linux-mtd@lists.infradead.org,
	David Jander <david.jander@protonic.nl>
Subject: Re: Mounting large JFFS2 causes other process to stop running!
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-09-06 at 15:52 +1000, Benny Chen wrote:
> Yap, that is right. My mtd is quite old it is packaged with linux-2.4.21
> kernel, so I checked the dates it is about 25/07/2002.  I guess
> mtd-linux is not supporting 2.4.x anymore.  We will probably have to cop
> this penalty until we upgrade our kernel.

If this is still a real problem in 2.4.31, then we would be interested
in fixing it. The background process _should_ be correctly yielding if
there are other processes to run.

-- 
dwmw2
