From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Julianne C.'" <juliannerc@gmail.com>,
	"'linux-mtd'" <linux-mtd@lists.infradead.org>
References: <e167438e0702191510v2f68036bt20af6f6db6d13bed@mail.gmail.com>
Subject: RE: OneNAND: Enabling ECC in main area
Date: Mon, 26 Feb 2007 09:16:46 +0900
Message-ID: <016301c7593b$6ac69450$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <e167438e0702191510v2f68036bt20af6f6db6d13bed@mail.gmail.com>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> 
> The bootloader on the board we use (LogicPD PXA270) does not 
> have ECC enabled during its operation.  Hence, we need to 
> enable it sometime during the OneNAND device driver setup.
> This is the code that is inserted in the onenand_probe 
> function, just after the first wait call.
> 
>     // Contains old value of sysconfig register from bootloader
>     syscfg = syscfg & 0xfeff; // ~0x0100;
> 
>     this->write_word (syscfg,
>                              this->base + ONENAND_REG_SYS_CFG1);
> 
> 
>     // Reset the command after enabling the ECC.
>     this->write_word (ONENAND_CMD_RESET,
>                              this->base + ONENAND_BOOTRAM);
> 
>     // Wait reset.
>     this->wait (mtd,
>                     FL_RESETING);

The order is wrong.

The Reset command set syscfg1 value to default.
If you want to keep the bootloader value you don't need to insert reset
command.

        /* Save system configuration 1 */
        syscfg = this->read_word(this->base + ONENAND_REG_SYS_CFG1);
        /* Clear Sync. Burst Read mode to read BootRAM */
        this->write_word((syscfg & ~ONENAND_SYS_CFG1_SYNC_READ), this->base
+ ONENAND_REG_SYS_CFG1);

        /* Send the command for reading device ID from BootRAM */
        this->write_word(ONENAND_CMD_READID, this->base + ONENAND_BOOTRAM);

        /* Read manufacturer and device IDs from BootRAM */
        bram_maf_id = this->read_word(this->base + ONENAND_BOOTRAM + 0x0);
        bram_dev_id = this->read_word(this->base + ONENAND_BOOTRAM + 0x2);

        /* Reset OneNAND to read default register values */
        this->write_word(ONENAND_CMD_RESET, this->base + ONENAND_BOOTRAM);
        /* Wait reset */
        this->wait(mtd, FL_RESETING);

=>   syscfg &= ~ONENAND_SYS_CFG1_NO_ECC;

        /* Restore system configuration 1 */
        this->write_word(syscfg, this->base + ONENAND_REG_SYS_CFG1);

Thank you,
Kyungmin Park
