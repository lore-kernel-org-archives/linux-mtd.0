From: David Woodhouse <dwmw2@infradead.org>
To: Michael McLellan <michael-mclellan@swsa.com.au>
In-Reply-To: <Pine.LNX.4.53.0310141638470.12391@slop.cobalttech.com>
References: <Pine.LNX.4.53.0310141537460.12298@slop.cobalttech.com>
	 <1066111607.3172.40.camel@imladris.demon.co.uk>
	 <Pine.LNX.4.53.0310141638470.12391@slop.cobalttech.com>
Content-Type: text/plain
Message-Id: <1066120362.14783.140.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 14 Oct 2003 09:32:44 +0100
Content-Transfer-Encoding: 7bit
cc: mtd list <linux-mtd@lists.infradead.org>
Subject: Re: DoC Grub booting problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-10-14 at 16:45 +1000, Michael McLellan wrote:
> > Don't you have to tell it that the menu.lst file is on (dc0,0) to make
> > it look there?
> 
> Yes I do, thats the problem.

Hmmm. Look at, and add more debugging to, find_config() and
try_config_partition() in stage2.c. 

Find out if they're actually being called. If not, why not -- and if so,
why aren't they finding the config file?

-- 
dwmw2
