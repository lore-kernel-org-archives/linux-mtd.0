From: dwmw2@infradead.org (David Woodhouse)
Date: 09 Feb 2003 13:05:28 +0000
Subject: grub-doc patch problem
In-Reply-To: <20030209125245.17383.qmail@web20801.mail.yahoo.com>
References: <20030209125245.17383.qmail@web20801.mail.yahoo.com>
Message-ID: <1044795927.2943.208.camel@imladris.demon.co.uk>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Sun, 2003-02-09 at 12:52, tony Tong wrote:

> Today I have used grub-2003-01-08-doc.patch to patch
> the GRUB cvs version . But I get more than one errors
> ,the following is selected from  my patch output
> result :

You mentioned that you are using WinCVS. I believe that when you check
out a file with CVS, it automatically 'fixes' the linefeeds to match the
system on which you're checking it out. So all the Unix linefeeds will
have been converted to CRLF to make Windows happy. 

However, that means that patch isn't happy, because it's looking for
lines that _don't_ end in a carriage return.

Try the '-l' option to patch, or running 'dos2unix' on the offending
files, or running CVS on a real box, or configuring CVS not to convert. 

-- 
dwmw2
