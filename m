From: purushn@future.futsoft.com (Purushothaman N)
Date: Mon, 24 Feb 2003 16:36:13 +0530
Subject: Root file system as CRAMFS on Flash
In-Reply-To: <1046083004.1545.32.camel@passion.cambridge.redhat.com>
Message-ID: <002d01c2dbf4$bf056460$1504060a@future.futsoft.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

>No you haven't. Turn off devfs or change it to 'root=/dev/mtdblock/2'

Thank you very much David.

Its working now.

with best regards,
Purush
-
To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at  http://www.tux.org/lkml/

***************************************************************************
This message is proprietary to Future Software Limited (FSL) 
and is intended solely for the use of the individual to whom it
is addressed. It may contain  privileged or confidential information 
and should not be circulated or used for any purpose other than for 
what it is intended. 

If you have received this message in error, please notify the
originator immediately. If you are not the intended recipient,
you are notified that you are strictly prohibited from using,
copying, altering, or disclosing the contents of this message. 
FSL accepts no responsibility for loss or damage arising from 
the use of the information transmitted by this email including
damage from virus.
***************************************************************************
