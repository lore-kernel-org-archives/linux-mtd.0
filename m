Received: from wa-out-1112.google.com ([209.85.146.180])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I9EJu-0003Jc-Fj
	for linux-mtd@lists.infradead.org; Fri, 13 Jul 2007 02:08:03 -0400
Received: by wa-out-1112.google.com with SMTP id v33so447601wah
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 Jul 2007 23:07:54 -0700 (PDT)
Message-ID: <9b52d64c0707122307j419d2d98xa771c2c09a280164@mail.gmail.com>
Date: Fri, 13 Jul 2007 11:37:53 +0530
From: "Vinit Agnihotri" <vinit.agnihotri@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: UBI: Can we handle -EINTR differently in erase/write path???
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi heres few code snip from erase_worker(); from wl.c
if (err != -EIO) {
        /*
         * If this is not %-EIO, we have no idea what to do. Scheduling
         * this physical eraseblock for erasure again would cause
         * errors again and again. Well, lets switch to RO mode.
         */
        ubi_ro_mode(ubi);
        return err;
    }

Suppose while erasure in progress & someone pressed "Ctrl+C" then UBI
straight way marks entire device as Read only & its really painful
because then you cant even delete that volume as UBI is read only.
Which I guess its not good way. If use cases are considered it is
highly likely that user can hit "Ctrl+c" , like he want to cancel
erase at that time or something like that. So we can handle -EINTR
differently by following way

if (err != -EIO) {
        /*
         * If this is not %-EIO, we have no idea what to do. Scheduling
         * this physical eraseblock for erasure again would cause
         * errors again and again. Well, lets switch to RO mode.
         */
        if (err == -EINTR) {
            schedule_erase(ubi, e, 0);
            return err;
        }
        else {
            ubi_ro_mode(ubi);
            return err;
        }
    }
i.e. we can again put that perticular peb to erase & can return
without making ubi RO mode.
same can be achieved in write path. If write as interrupted then we
can return error to user & can put that peb back to erase  list.

This is my initial understanding about handling -EINTR, however I
would like to know views of others. If all agrees I can post patch for
same.

Thanks & Regards
Vinit.
