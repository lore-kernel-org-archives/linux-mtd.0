From: David Woodhouse <dwmw2@infradead.org>
To: Jonas Holmberg <jonas.holmberg@axis.com>
In-Reply-To: <20050203095842.GA20345@axis.com>
References: <20050202110715.GH27015@axis.com> <20050203095842.GA20345@axis.com>
Content-Type: text/plain
Date: Thu, 03 Feb 2005 10:23:52 +0000
Message-Id: <1107426233.12383.46.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Device ID collision in amd_flash.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-02-03 at 10:58 +0100, Jonas Holmberg wrote:
> Silly me, who cares about obsolete drivers...
> Let me rephrase that question: Any objections before I commit on 
> friday (tomorrow)?

Sorry, go ahead.

> I still would like to know how bugfixes finds their way into Linux 
> 2.4. As I understand, the main trunk in CVS is for 2.6 and I can't 
> find any 2.4-branch...

In general, they don't get in to 2.4. Nobody cares about 2.4 any more.
If it _works_ for you, all well and good. But if it hasn't already been
working for you for a year, then why are you trying to make it work now?
Use 2.6.

Feel free to send this change to Marcelo if you really care.

-- 
dwmw2
