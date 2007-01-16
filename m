Subject: Re: __user removed from mtd-abi.h
From: David Woodhouse <dwmw2@infradead.org>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.0701160805030.11369@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0701160805030.11369@lnxricardw.se.axis.com>
Content-Type: text/plain
Date: Tue, 16 Jan 2007 23:01:47 +1100
Message-Id: <1168948907.3439.3.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>, mchehab@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-01-16 at 08:21 +0100, Ricard Wanderlof wrote:
> The commitlog from dmwm2 says 'Now that we have headers_install, we don't 
> need this crap.'. Makes sense, but where is __user supposed to be defined 
> now - it is used as an identifier further down in the file, and userspace 
> programs that include mtd-abi.h therefore break during compilation. 
> mtd-abi.h doesn't appear to simply be a userspace version of a kernel 
> include file. 

It _isn't_ defined. We automatically strip it out from the headers we
install...

shinybook /shiny/git/linux-2.6 $ make INSTALL_HDR_PATH=/tmp/foo headers_install >/dev/null
shinybook /shiny/git/linux-2.6 $ grep __user -r /tmp/foo/include
/tmp/foo/include/linux/capability.h:typedef struct __user_cap_header_struct {
/tmp/foo/include/linux/capability.h:typedef struct __user_cap_data_struct {
/tmp/foo/include/linux/videodev2.h:#define __user

Hm, that last one's a bug -- but there's certainly none in mtd-abi.h.

-- 
dwmw2
